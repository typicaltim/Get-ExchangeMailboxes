<# EXCHANGE MAILBOX INFORMATION EXPORT
   Description:
   Grabs every exchange account, then selects the desired properties, then saves that information to a CSV.
   Intended to be used to figure out licensing demands for Office365.

    Author:             typicaltim
    Last Modified:      July 17th, 2017

    Notes:
        Get-MailBox only works for User Mailboxes. Get-Recipient is more broad, hence why I used it (allows all recipient types).
        Get-MailboxStatistics can be  used to gather information on the size of the mailbox and the logon dates.
#>

<# VARIABLE DECALRATION #>
$userlist = *
$attributefilter = Alias,DisplayName,Department,OrganizationalUnit,RecipientType,WhenCreated,WhenChanged
$mailboxdata = Get-Recipient -ResultSize Unlimited -Identity $userlist | Select-Object $attributefilter
$savelocation = \\server\folder\exchange-mailbox-data.csv

<# RUN #>
$mailboxdata | Export-Csv $savelocation -NoTypeInformation -Delimiter ","
