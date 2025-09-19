// Test script to check child distribution
const testData = [
  {
    "child_name": "Aisha Patel",
    "organization": "St. Mary's Hospital"
  },
  {
    "child_name": "Emma Thompson",
    "organization": "St. Mary's Hospital"
  },
  {
    "child_name": "Charlie Brown",
    "organization": "Wellmind Children's Clinic"
  },
  {
    "child_name": "Maya Rodriguez",
    "organization": "Wellmind Children's Clinic"
  },
  {
    "child_name": "Sebastian Clarke",
    "organization": "Wellmind Children's Clinic"
  },
  {
    "child_name": "Ava Davis",
    "organization": "Westfield Primary School"
  },
  {
    "child_name": "Lucas Williams",
    "organization": "Westfield Primary School"
  },
  {
    "child_name": "Oliver Johnson",
    "organization": "Westfield Primary School"
  },
  {
    "child_name": "Sophia Chen",
    "organization": "Westfield Primary School"
  }
];

// Group by organization
const byOrg = {};
testData.forEach(child => {
  if (!byOrg[child.organization]) {
    byOrg[child.organization] = [];
  }
  byOrg[child.organization].push(child.child_name);
});

console.log('Current Child Distribution:');
console.log('===========================\n');

Object.keys(byOrg).sort().forEach(org => {
  console.log(`${org} (${byOrg[org].length} children):`);
  byOrg[org].forEach(name => {
    console.log(`  - ${name}`);
  });
  console.log();
});

console.log('To achieve 3-3-3 distribution:');
console.log('Move Sophia Chen from Westfield Primary School to St. Mary\'s Hospital');
console.log('\nFinal Distribution Would Be:');
console.log('- St. Mary\'s Hospital (3): Aisha Patel, Emma Thompson, Sophia Chen');
console.log('- Wellmind Children\'s Clinic (3): Charlie Brown, Maya Rodriguez, Sebastian Clarke');
console.log('- Westfield Primary School (3): Ava Davis, Lucas Williams, Oliver Johnson');