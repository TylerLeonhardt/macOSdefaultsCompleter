@{
defaults_read = @"
The syntax of this command is:

defaults read [domain [key]]

read
Prints all of the user's defaults, for every domain, to standard output.

read <domain>
Prints all of the user's defaults for domain to standard output.

read <domain> <key>
Prints the value for the default of domain identified by key.
"@

defaults_read_type = @"
The syntax of this command is:

defaults read-type domain key

read-type <domain> <key>
Prints the plist type for the given domain identified by key.
"@

defaults_rename = @"
The syntax of this command is:

defaults rename domain old_key new_key

rename <domain> <old_key> <new_key>
renames old_key to new_key.
"@

defaults_write = @"
The syntax of this command is:

defaults write domain { 'plist' | key 'value' }

write <domain> <key> '<value>'
Writes value as the value for key in domain.  value must be a property list, and must be enclosed in single quotes.  For example:

    defaults write com.companyname.appname "Default Color" '(255, 0, 0)'

sets the value for Default Color to an array containing the strings 255, 0, 0 (the red, green, and blue components). Note that the key is enclosed in quotation
marks because it contains a space.

write <domain> '<plist>'
Overwrites the defaults information in domain with that given as plist.  plist must be a property list representation of a dictionary, and must be enclosed in
single quotes.  For example:

    defaults write com.companyname.appname '{ "Default Color" = (255, 0, 0);
        "Default Font" = Helvetica; }';

erases any previous defaults for com.companyname.appname and writes the values for the two names into the defaults system.
"@

defaults_delete = @"
The syntax of this command is:

defaults delete [domain [key]]

delete <domain>
Removes all default information for domain.

delete <domain> <key>
Removes the default named key from domain.
"@

defaults_import = @"
The syntax of this command is:

defaults import <domain> { 'path to plist' | '-' }

import <domain> <path to plist>
writes the plist at path to domain

import <domain> -
writes a plist from stdin to domain
"@

defaults_export = @"
The syntax of this command is:

defaults export <domain> { 'path to plist' | '-' }

export <domain> <path to plist>
saves domain as a binary plist to path

export <domain> -
writes domain as an xml plist to stdout
"@

defaults_domains = @"
The syntax of this command is:

defaults domains

domains
Prints the names of all domains in the user's defaults system.
"@

defaults_find = @"
The syntax of this command is:

defaults find word

find <word>
Searches for word in the domain names, keys, and values of the user's defaults, and prints out a list of matches.
"@

defaults_help = @"
The syntax of this command is:

defaults help

help
Prints a list of possible command formats.
"@
}
