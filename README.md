# My website

<!-- toc -->

- [Information](#information)
- [Progress & blockers](#progress--blockers)
  * [Custom domain setup for GitHub](#custom-domain-setup-for-github)
  * [DNS check](#dns-check)
  * [Domain verification](#domain-verification)
  * [SSL encryption](#ssl-encryption)
- [Info on previous website setup](#info-on-previous-website-setup)
  * [Migration from my previous website setup](#migration-from-my-previous-website-setup)
  * [How it worked](#how-it-worked)
  * [Past issues with Fruition](#past-issues-with-fruition)

<!-- tocstop -->

## Learnings
- The file `CNAME` contains the domain name.
- `apex domain` is a domain without a leading `www`.
- Some website data (DNS, SSL encryption) can be inspected via the connection
  icon in the address bar of a browser.

```txt
https://foobar.chris-grieser.de/some/pages/here?query=asdf
        ^---------------------^
this part is the realm of DNS
                               ^-------------------------^
                                this part is all up to the server
```

## Basic info
**Domain:** <https://chris-grieser.de/>
- bought via [Strato](https://www.strato.de/)
- apparently does not include `www.chris-grieser.de`
- Allows up to 10 subdomains, however due to Strato only allowing one `A` and
  `AAA` record, it is not possible to use any subdomains with GitHub pages
  (`subdomain.chris-grieser.de`). Sub*sites* though should still be possible
  (`chris-grieser.de/subsite`).

## Setup

### Custom domain for the GitHub page
- [GitHub docs: Manage custom
  domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site)
- Strato's dashboard only offers `A` and `AAAA` as the type of address.
- GitHub names 4 addresses each for `A` and `AAAA`, but `strato.de` only
  accepts one each. This restricts stability/reachability, but is tolerable for
  just a personal website.

```bash
# verify A/AAAA records
dig chris-grieser.de +noall +answer -t A
dig chris-grieser.de +noall +answer -t AAAA

# expected output
chris-grieser.de.       150     IN      A       185.199.108.153
chris-grieser.de.       92      IN      AAAA    2606:50c0:8000::153
```

### DNS check
GitHub's DNS check errors in is unsuccessful with the message:

> Both `chris-grieser.de` and its alternate name are improperly configured
> Domain's DNS record could not be retrieved. For more information, see
> documentation (`InvalidDNSError`).

It is unclear whether this is an issue, might be because only one `A` and `AAAA`
record can be configured at Strato. Website does work.

### Domain verification
[Verifying the domain is
recommended.](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/verifying-your-custom-domain-for-github-pages)

> [!NOTE]
> However, the manual refers to buttons that do not exist on the page, e.g.,
> `Add domain` does not exist on the [pages configuration](https://github.com/chrisgrieser/chrisgrieser.github.io/settings/pages).

### SSL encryption
My package at Strato includes a [basic SSL
certificate](https://www.strato.de/faq/domains/wie-kann-ich-mein-kostenfreies-strato-ssl-zertifikat-verwenden/).
It does only offer encryption for the main domain, not any subdomains. 

However, due to using GitHub pages, it's the site uses the certificate from
"Let's encrypt" (the provider used by GitHub).

## Info on previous website setup
*Information here kept for reference, the website itself does no longer exist.*

### Migration from my previous website setup
1. Export Notion content, delete notion page.
2. Delete Web Worker at CloudFlare from the Fruition setup. Delete CloudFlare
   account with the intention of only Strato for DNS and domain. (To keep the
   number of required pieces to a minimum.)
3. At the Strato dashboard, removed the use of the CloudFlare DNS and configured
   the domain to use Strato's DNS.

### How it worked
Components:
- [Notion public sites](http://www.notion.so) &
  [Fruition](https://fruitionsite.com/) for the content.
- [Strato](https://www.strato.de/) for the domain.
- [Cloudflare](http://www.cloudflare.com) was used as DNS service.

I followed the instructions on the Fruition website (which are down at the
moment).

### Past issues with Fruition
- ["Issue with your iOS app" error · Issue #55](https://github.com/stephenou/fruitionsite/issues/55#issuecomment-1978266460)
- [Doesn't the script work anymore? · Issue #287](https://github.com/stephenou/fruitionsite/issues/287)
