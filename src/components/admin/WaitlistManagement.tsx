import React, { useState, useEffect } from 'react'
import { Button } from '../ui/button'
import { Card, CardContent, CardHeader, CardTitle } from '../ui/card'
import { getSupabaseClient } from '../../utils/supabase/client'
import { Trash2, ChevronLeft, ChevronRight, Users, Mail, Building2, Download } from 'lucide-react'

interface WaitlistEntry {
  id: number
  name: string
  email: string
  organization: string | null
  role: string | null
  created_at: string
}

export function WaitlistManagement() {
  const [entries, setEntries] = useState<WaitlistEntry[]>([])
  const [loading, setLoading] = useState(true)
  const [currentPage, setCurrentPage] = useState(1)
  const [totalEntries, setTotalEntries] = useState(0)
  const [deleting, setDeleting] = useState<number | null>(null)
  
  const itemsPerPage = 10
  const totalPages = Math.ceil(totalEntries / itemsPerPage)

  const loadWaitlistEntries = async () => {
    setLoading(true)
    try {
      const supabase = getSupabaseClient()
      
      // Get total count
      const { count } = await supabase
        .from('waitlist')
        .select('*', { count: 'exact', head: true })
      
      setTotalEntries(count || 0)
      
      // Get paginated data
      const { data, error } = await supabase
        .from('waitlist')
        .select('*')
        .order('created_at', { ascending: false })
        .range((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage - 1)
      
      if (error) {
        console.error('Error loading waitlist:', error)
        return
      }
      
      setEntries(data || [])
    } catch (err) {
      console.error('Error:', err)
    } finally {
      setLoading(false)
    }
  }

  const deleteEntry = async (id: number) => {
    setDeleting(id)
    try {
      const supabase = getSupabaseClient()
      const { error } = await supabase
        .from('waitlist')
        .delete()
        .eq('id', id)
      
      if (error) {
        console.error('Error deleting entry:', error)
        return
      }
      
      // Reload the current page
      loadWaitlistEntries()
    } catch (err) {
      console.error('Error:', err)
    } finally {
      setDeleting(null)
    }
  }

  const formatDate = (dateString: string) => {
    return new Date(dateString).toLocaleDateString('en-GB', {
      day: '2-digit',
      month: '2-digit', 
      year: 'numeric',
      hour: '2-digit',
      minute: '2-digit'
    })
  }

  const formatRole = (role: string | null) => {
    if (!role) return '-'
    return role.replace('-', ' ').replace(/\b\w/g, l => l.toUpperCase())
  }

  const downloadCSV = async () => {
    try {
      const supabase = getSupabaseClient()
      
      // Get all entries for CSV export
      const { data, error } = await supabase
        .from('waitlist')
        .select('*')
        .order('created_at', { ascending: false })
      
      if (error) {
        console.error('Error downloading CSV:', error)
        return
      }
      
      if (!data || data.length === 0) {
        return
      }
      
      // Create CSV content
      const headers = ['Name', 'Email', 'Organisation', 'Role', 'Date Added']
      const csvContent = [
        headers.join(','),
        ...data.map(entry => [
          `"${entry.name}"`,
          `"${entry.email}"`,
          `"${entry.organization || ''}"`,
          `"${formatRole(entry.role)}"`,
          `"${formatDate(entry.created_at)}"`
        ].join(','))
      ].join('\n')
      
      // Download file
      const blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' })
      const link = document.createElement('a')
      const url = URL.createObjectURL(blob)
      link.setAttribute('href', url)
      link.setAttribute('download', `waitlist-export-${new Date().toISOString().split('T')[0]}.csv`)
      link.style.visibility = 'hidden'
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)
    } catch (err) {
      console.error('Error downloading CSV:', err)
    }
  }

  useEffect(() => {
    loadWaitlistEntries()
  }, [currentPage])

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-96">
        <div className="text-center">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-gray-900 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading waitlist entries...</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-gray-50 p-6">
      <div className="max-w-7xl mx-auto">
        <div className="space-y-6">
          {/* Header */}
          <div className="flex items-center justify-between">
            <div>
              <h1 className="text-2xl font-bold text-gray-900">Waitlist Management</h1>
              <p className="text-gray-600">Manage users who have joined the waitlist</p>
            </div>
        
        <div className="flex items-center gap-4">
          <div className="flex items-center gap-2 text-sm text-gray-600">
            <Users className="h-4 w-4" />
            <span>{totalEntries} total entries</span>
          </div>
        </div>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <Users className="h-8 w-8 text-blue-600" />
              <div className="ml-4">
                <p className="text-sm font-medium text-gray-600">Total Entries</p>
                <p className="text-2xl font-bold text-gray-900">{totalEntries}</p>
              </div>
            </div>
          </CardContent>
        </Card>
        
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <Mail className="h-8 w-8 text-green-600" />
              <div className="ml-4">
                <p className="text-sm font-medium text-gray-600">With Email</p>
                <p className="text-2xl font-bold text-gray-900">{totalEntries}</p>
              </div>
            </div>
          </CardContent>
        </Card>
        
        <Card>
          <CardContent className="p-6">
            <div className="flex items-center">
              <Building2 className="h-8 w-8 text-purple-600" />
              <div className="ml-4">
                <p className="text-sm font-medium text-gray-600">With Organisation</p>
                <p className="text-2xl font-bold text-gray-900">
                  {entries.filter(e => e.organization).length}
                </p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* Waitlist Table */}
      <Card>
        <CardHeader>
          <div className="flex items-center justify-between">
            <CardTitle>Waitlist Entries</CardTitle>
            {entries.length > 0 && (
              <Button 
                variant="outline" 
                size="sm"
                onClick={downloadCSV}
                className="flex items-center gap-2"
              >
                <Download className="h-4 w-4" />
                Download CSV
              </Button>
            )}
          </div>
        </CardHeader>
        <CardContent>
          {entries.length === 0 ? (
            <div className="text-center py-8">
              <Users className="h-12 w-12 text-gray-400 mx-auto mb-4" />
              <p className="text-gray-600">No waitlist entries found</p>
            </div>
          ) : (
            <>
              <div className="overflow-x-auto">
                <table className="w-full">
                  <thead>
                    <tr className="border-b border-gray-200">
                      <th className="text-left py-3 px-4 font-medium text-gray-900">Name</th>
                      <th className="text-left py-3 px-4 font-medium text-gray-900">Email</th>
                      <th className="text-left py-3 px-4 font-medium text-gray-900">Organisation</th>
                      <th className="text-left py-3 px-4 font-medium text-gray-900">Role</th>
                      <th className="text-left py-3 px-4 font-medium text-gray-900">Date Added</th>
                      <th className="text-left py-3 px-4 font-medium text-gray-900">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                    {entries.map((entry) => (
                      <tr key={entry.id} className="border-b border-gray-100 hover:bg-gray-50">
                        <td className="py-3 px-4">
                          <div className="font-medium text-gray-900">{entry.name}</div>
                        </td>
                        <td className="py-3 px-4">
                          <div className="text-gray-600">{entry.email}</div>
                        </td>
                        <td className="py-3 px-4">
                          <div className="text-gray-600">{entry.organization || '-'}</div>
                        </td>
                        <td className="py-3 px-4">
                          <div className="text-gray-600">{formatRole(entry.role)}</div>
                        </td>
                        <td className="py-3 px-4">
                          <div className="text-gray-600 text-sm">{formatDate(entry.created_at)}</div>
                        </td>
                        <td className="py-3 px-4">
                          <Button
                            variant="outline"
                            size="sm"
                            onClick={() => deleteEntry(entry.id)}
                            disabled={deleting === entry.id}
                            className="text-red-600 hover:text-red-700 hover:bg-red-50 border-red-200"
                          >
                            {deleting === entry.id ? (
                              <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-red-600"></div>
                            ) : (
                              <Trash2 className="h-4 w-4" />
                            )}
                          </Button>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>

              {/* Pagination */}
              {totalPages > 1 && (
                <div className="flex items-center justify-between mt-6">
                  <div className="text-sm text-gray-600">
                    Showing {((currentPage - 1) * itemsPerPage) + 1} to {Math.min(currentPage * itemsPerPage, totalEntries)} of {totalEntries} entries
                  </div>
                  
                  <div className="flex items-center space-x-2">
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => setCurrentPage(prev => Math.max(1, prev - 1))}
                      disabled={currentPage === 1}
                    >
                      <ChevronLeft className="h-4 w-4" />
                      Previous
                    </Button>
                    
                    <div className="flex items-center space-x-1">
                      {Array.from({ length: totalPages }, (_, i) => i + 1).map(page => (
                        <Button
                          key={page}
                          variant={page === currentPage ? "default" : "outline"}
                          size="sm"
                          onClick={() => setCurrentPage(page)}
                          className="w-8 h-8 p-0"
                        >
                          {page}
                        </Button>
                      ))}
                    </div>
                    
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => setCurrentPage(prev => Math.min(totalPages, prev + 1))}
                      disabled={currentPage === totalPages}
                    >
                      Next
                      <ChevronRight className="h-4 w-4" />
                    </Button>
                  </div>
                </div>
              )}
            </>
          )}
        </CardContent>
      </Card>
        </div>
      </div>
    </div>
  )
}