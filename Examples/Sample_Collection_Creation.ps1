# This is the sample configuraiton.  It contains all resource settings

Configuration SCCMSample
{ 
    param 
    (
        [Parameter(Mandatory=$true)][ValidateNotNullorEmpty()][PsCredential]$SCCMAdministratorCredential
    )
    
    Import-DSCResource -ModuleName cSCCM
    
    Node $AllNodes
    {

        cCMFolder DeviceSystems
        { 
            FolderName = "Systems"
            FolderType = "Device Collection"
            ParentFolder = "Root"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        } 
   
        cCMFolder DeviceSystemsType
        { 
            FolderName = "Systems - Type"
            FolderType = "Device Collection"
            ParentFolder = "Systems"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }
        
        cCMFolder DeviceSystemsLocation
        { 
            FolderName = "Systems - Location"
            FolderType = "Device Collection"
            ParentFolder = "Systems"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        } 
        
        cCMFolder DeviceSystemsDepartment
        { 
            FolderName = "Systems - Department"
            FolderType = "Device Collection"
            ParentFolder = "Systems"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }  


        cCMCollection DeviceAllWorkstations
        { 
            CollectionName = "All Workstations"
		    LimitingCollectionName = "All Systems"
		    ParentFolder = "Root"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }
        
        cCMCollectionRule DeviceAllWorkstationsQuery
        {
            RuleName = 'Windows Workstations'
            ParentCollection = 'All Workstations'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Workstation%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        } 

        cCMCollection DeviceAllServers
        { 
            CollectionName = "All Servers"
		    LimitingCollectionName = "All Systems"
		    ParentFolder = "Root"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAllServersQuery
        {
            RuleName = 'Windows Servers'
            ParentCollection = 'All Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Server%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        } 

        cCMCollection DeviceAllWin7
        { 
            CollectionName = "Systems - Type - Windows 7 Workstations"
		    LimitingCollectionName = "All Workstations"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAllWin7Query
        {
            RuleName = 'Windows 7 Clients'
            ParentCollection = 'Systems - Type - Windows 7 Workstations'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Workstation 6.1%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceAllWin8
        { 
            CollectionName = "Systems - Type - Windows 8 Workstations"
		    LimitingCollectionName = "All Workstations"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }
        
        cCMCollectionRule DeviceAllWin8Query
        {
            RuleName = 'Windows 8 Clients'
            ParentCollection = 'Systems - Type - Windows 8 Workstations'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Workstation 6.2%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceAllWin81
        { 
            CollectionName = "Systems - Type - Windows 8.1 Workstations"
		    LimitingCollectionName = "All Workstations"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAllWin81Query
        {
            RuleName = 'Windows 8.1 Clients'
            ParentCollection = 'Systems - Type - Windows 8.1 Workstations'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Workstation 6.3%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceAllWinXP
        { 
            CollectionName = "Systems - Type - Windows XP Workstations"
		    LimitingCollectionName = "All Workstations"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAllWinXPQuery
        {
            RuleName = 'Windows XP Clients'
            ParentCollection = 'Systems - Type - Windows XP Workstations'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Workstation 5.1%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceAllSCCM
        { 
            CollectionName = "Systems - Type - ConfigManager Servers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAllSCCMQuery
        {
            RuleName = 'Query SCCM Roles'
            ParentCollection = 'Systems - Type - ConfigManager Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System where SMS_R_System.SystemRoles IS NOT NULL'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceAll2008
        { 
            CollectionName = "Systems - Type - Windows 2008 Servers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAll2008Query
        {
            RuleName = '2008 Name Query'
            ParentCollection = 'Systems - Type - Windows 2008 Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_System.ResourceId, SMS_R_System.ResourceType, SMS_R_System.Name, SMS_R_System.SMSUniqueIdentifier, SMS_R_System.ResourceDomainORWorkgroup, SMS_R_System.Client from  SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Server 6.0%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceAll2008R2
        { 
            CollectionName = "Systems - Type - Windows 2008 R2 Servers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAll2008R2Query
        {
            RuleName = '2008 R2 Name Query'
            ParentCollection = 'Systems - Type - Windows 2008 R2 Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_System.ResourceId, SMS_R_System.ResourceType, SMS_R_System.Name, SMS_R_System.SMSUniqueIdentifier, SMS_R_System.ResourceDomainORWorkgroup, SMS_R_System.Client from  SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Server 6.1%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceAll2012
        { 
            CollectionName = "Systems - Type - Windows 2012 Servers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAll2012Query
        {
            RuleName = '2012 Name Query'
            ParentCollection = 'Systems - Type - Windows 2012 Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_System.ResourceId, SMS_R_System.ResourceType, SMS_R_System.Name, SMS_R_System.SMSUniqueIdentifier, SMS_R_System.ResourceDomainORWorkgroup, SMS_R_System.Client from  SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Server 6.2%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceAll2012R2
        { 
            CollectionName = "Systems - Type - Windows 2012 R2 Servers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceAll2012R2Query
        {
            RuleName = '2012 R2 Name Query'
            ParentCollection = 'Systems - Type - Windows 2012 R2 Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_System.ResourceId, SMS_R_System.ResourceType, SMS_R_System.Name, SMS_R_System.SMSUniqueIdentifier, SMS_R_System.ResourceDomainORWorkgroup, SMS_R_System.Client from  SMS_R_System where SMS_R_System.OperatingSystemNameandVersion LIKE "%Server 6.3%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceDCs
        { 
            CollectionName = "Systems - Type - Domain Controllers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceDCsQuery
        {
            RuleName = 'DC Role Query'
            ParentCollection = 'Systems - Type - Domain Controllers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select SMS_R_SYSTEM.ResourceID,SMS_R_SYSTEM.ResourceType,SMS_R_SYSTEM.Name,SMS_R_SYSTEM.SMSUniqueIdentifier,SMS_R_SYSTEM.ResourceDomainORWorkgroup,SMS_R_SYSTEM.Client from SMS_R_System inner join SMS_G_System_COMPUTER_SYSTEM on SMS_G_System_COMPUTER_SYSTEM.ResourceId = SMS_R_System.ResourceId where SMS_G_System_COMPUTER_SYSTEM.Roles like "%Domain_Controller%"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceDNSServers
        { 
            CollectionName = "Systems - Type - DNS Servers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceDNSQuery
        {
            RuleName = 'DNS Role Query'
            ParentCollection = 'Systems - Type - DNS Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select * from SMS_R_System inner join SMS_G_System_SERVICE on SMS_G_System_SERVICE.ResourceID = SMS_R_System.ResourceId where SMS_G_System_SERVICE.DisplayName = "DNS Server" and SMS_G_System_SERVICE.StartMode = "Auto"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection DeviceDHCPServers
        { 
            CollectionName = "Systems - Type - DHCP Servers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule DeviceDHCPQuery
        {
            RuleName = 'DHCP Role Query'
            ParentCollection = 'Systems - Type - DHCP Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select * from SMS_R_System inner join SMS_G_System_SERVICE on SMS_G_System_SERVICE.ResourceID = SMS_R_System.ResourceId where SMS_G_System_SERVICE.DisplayName = "DHCP Server" and SMS_G_System_SERVICE.StartMode = "Auto"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollection HyperVServers
        { 
            CollectionName = "Systems - Type - Hyper-V Servers"
		    LimitingCollectionName = "All Servers"
		    ParentFolder = "Systems - Type"
		    CollectionType = "Device"
		    RefreshDays = "7"
		    RefreshType = "Both"
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }

        cCMCollectionRule HyperVServersQuery
        {
            RuleName = 'Hyper-V Role Query'
            ParentCollection = 'Systems - Type - Hyper-V Servers'
            ParentCollectionType = 'Device'
            QueryType = 'Query'
            QueryExpression = 'select * from SMS_R_System inner join SMS_G_System_SERVICE on SMS_G_System_SERVICE.ResourceID = SMS_R_System.ResourceId where SMS_G_System_SERVICE.DisplayName = "Hyper-V Virtual Machine Management" and SMS_G_System_SERVICE.StartMode = "Auto"'
            SCCMAdministratorCredential = $SCCMAdministratorCredential
            Ensure = "Present"
        }
    }
} 

# These variables are specfic settings for each target node that get applied to the DSC configiguration template; probably not a grat idea to allow plaintext in prod
$ProximusHosts = @{ 
    AllNodes = @( 
 
        @{ 
            NodeName = "SCCMServer"
            PSDscAllowPlainTextPassword=$true
        }
    ); 
}

