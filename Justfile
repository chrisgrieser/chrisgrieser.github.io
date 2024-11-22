set quiet := true

[macos]
open-page:
    open "https://chris-grieser.de/"

[macos]
open-page-settings:
    open "https://github.com/chrisgrieser/chrisgrieser.github.io/settings/pages"
    open "https://www.strato.de/apps/CustomerService"

# A/AAAA records
verify-dns-settings:
    #!/usr/bin/env zsh
    print "\e[1;34mExpected output\e[0m"
    chris-grieser.de.       150     IN      A       185.199.108.153
    chris-grieser.de.       92      IN      AAAA    2606:50c0:8000::153

    dig chris-grieser.de +noall +answer -t A
    dig chris-grieser.de +noall +answer -t AAAA
