// Convert Amelia Thompson JSON export to SQL import script
const fs = require('fs');

const jsonData = JSON.parse(fs.readFileSync(process.argv[2], 'utf8'));
const profile = jsonData.data.profiles.records[0];
const sessions = jsonData.data.checkin_sessions.records;
const moodData = jsonData.data.mood_meter_usage.records;
const emotionGridUsage = jsonData.data.emotion_grid_usage.records;
const emotionGridFeelings = jsonData.data.emotion_grid_feelings.records;
const breathingData = jsonData.data.breathing_tool_usage.records;
const wellbeingUsage = jsonData.data.wellbeing_wheel_usage.records;
const wellbeingSections = jsonData.data.wellbeing_wheel_sections.records;

let sql = `-- Import ${profile.name} data to Supabase
-- ${jsonData.metadata.organization}
-- ${sessions.length} check-in sessions with complete tool usage data

DO $$
DECLARE
    child_id UUID;
`;

// Declare session variables
sessions.forEach((_, i) => {
    sql += `    session${i + 1}_id UUID;\n`;
});

sql += `    org_id UUID := '${profile.org_id}';\n`;
sql += `BEGIN\n`;

// Insert profile
sql += `    -- Insert child profile
    INSERT INTO profiles (id, email, name, role, org_id, status, avatar_url, created_at, updated_at, practitioner_id)
    VALUES (
        gen_random_uuid(),
        NULL,
        '${profile.name}',
        'Child',
        org_id,
        '${profile.status}',
        NULL,
        '${profile.created_at}',
        '${profile.updated_at}',
        NULL
    ) RETURNING id INTO child_id;

`;

// Insert sessions
sql += `    -- Insert check-in sessions\n`;
sessions.forEach((session, i) => {
    const tools = session.tools_completed.map(t => `'${t}'`).join(', ');
    sql += `    INSERT INTO checkin_sessions (id, child_id, org_id, started_at, completed_at, status, tools_completed, created_at, updated_at)
    VALUES (gen_random_uuid(), child_id, org_id, '${session.started_at}', '${session.completed_at}', '${session.status}', ARRAY[${tools}], '${session.created_at}', '${session.updated_at}')
    RETURNING id INTO session${i + 1}_id;

`;
});

// Insert mood meter data
sql += `    -- Insert mood meter usage\n`;
sql += `    INSERT INTO mood_meter_usage (id, session_id, child_id, org_id, mood_level, mood_numeric, selected_at, time_to_select_seconds, was_skipped, notes, created_at)\n`;
sql += `    VALUES\n`;
moodData.forEach((mood, i) => {
    const sessionIndex = sessions.findIndex(s => s.id === mood.session_id) + 1;
    const notes = (mood.notes || '').replace(/'/g, "''");
    const comma = i < moodData.length - 1 ? ',' : ';';
    sql += `        (gen_random_uuid(), session${sessionIndex}_id, child_id, org_id, '${mood.mood_level}', ${mood.mood_numeric}, '${mood.selected_at}', ${mood.time_to_select_seconds}, ${mood.was_skipped}, '${notes}', '${mood.created_at}')${comma}\n`;
});

// Insert breathing tool data
if (breathingData.length > 0) {
    sql += `\n    -- Insert breathing tool usage\n`;
    sql += `    INSERT INTO breathing_tool_usage (id, session_id, child_id, org_id, started_at, completed_at, duration_seconds, breathing_pattern, cycles_completed, was_skipped, notes, created_at)\n`;
    sql += `    VALUES\n`;
    breathingData.forEach((breathing, i) => {
        const sessionIndex = sessions.findIndex(s => s.id === breathing.session_id) + 1;
        const notes = (breathing.notes || '').replace(/'/g, "''");
        const comma = i < breathingData.length - 1 ? ',' : ';';
        sql += `        (gen_random_uuid(), session${sessionIndex}_id, child_id, org_id, '${breathing.started_at}', '${breathing.completed_at}', ${breathing.duration_seconds}, '${breathing.breathing_pattern}', ${breathing.cycles_completed}, ${breathing.was_skipped}, '${notes}', '${breathing.created_at}')${comma}\n`;
    });
}

// Insert emotion grid usage and feelings
if (emotionGridUsage.length > 0) {
    sql += `\n    -- Insert emotion grid usage\n`;
    emotionGridUsage.forEach((usage, i) => {
        const sessionIndex = sessions.findIndex(s => s.id === usage.session_id) + 1;
        const explanation = (usage.explanation_text || '').replace(/'/g, "''");
        const notes = usage.notes ? `'${usage.notes.replace(/'/g, "''")}'` : 'NULL';

        sql += `    INSERT INTO emotion_grid_usage (id, session_id, child_id, org_id, started_at, completed_at, step_completed, explanation_text, explanation_length, input_method, was_skipped, completion_status, notes, created_at, updated_at, wants_adult_conversation)
    VALUES (gen_random_uuid(), session${sessionIndex}_id, child_id, org_id, '${usage.started_at}', '${usage.completed_at}', ${usage.step_completed}, '${explanation}', ${usage.explanation_length}, '${usage.input_method}', ${usage.was_skipped}, '${usage.completion_status}', ${notes}, '${usage.created_at}', '${usage.updated_at}', ${usage.wants_adult_conversation});

`;
    });
}

// Insert wellbeing wheel usage and sections
if (wellbeingUsage.length > 0) {
    sql += `    -- Insert wellbeing wheel usage\n`;
    wellbeingUsage.forEach((usage, i) => {
        const sessionIndex = sessions.findIndex(s => s.id === usage.session_id) + 1;
        const notes = usage.notes ? `'${usage.notes.replace(/'/g, "''")}'` : 'NULL';

        sql += `    INSERT INTO wellbeing_wheel_usage (id, session_id, child_id, org_id, started_at, completed_at, completion_status, notes, created_at, updated_at)
    VALUES (gen_random_uuid(), session${sessionIndex}_id, child_id, org_id, '${usage.started_at}', '${usage.completed_at}', '${usage.completion_status}', ${notes}, '${usage.created_at}', '${usage.updated_at}');

`;
    });
}

sql += `    RAISE NOTICE 'Successfully added ${profile.name} with % check-in sessions', ${sessions.length};\n`;
sql += `END $$;\n`;

console.log(sql);