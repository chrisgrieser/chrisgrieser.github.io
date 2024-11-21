# My website
Domain: <https://chris-grieser.de/>, bought via
[Strato](https://www.strato.de/).

<!-- toc -->

- [Information](#information)
- [Progress & blockers](#progress--blockers)
  * [Migration from Fruition (my previous website setup)](#migration-from-fruition-my-previous-website-setup)
  * [Custom domain setup](#custom-domain-setup)
  * [DNS check](#dns-check)
  * [Domain verification](#domain-verification)
  * [SSL encryption](#ssl-encryption)
- [Info on previous website](#info-on-previous-website)
  * [How it worked](#how-it-worked)
  * [Past issues with Fruition](#past-issues-with-fruition)

<!-- tocstop -->

## Information
- `CNAME` contains the domain name.
- `apex domain` is a domain without a leading `www`.
- Working example
	* [GitHub
	  backend](https://github.com/mProjectsCode/mProjectsCode.github.io).
	* [Frontend with custom domain](https://www.moritzjung.dev/).

> [!NOTE]
> Apparently, I only own `chris-grieser.de`, but not `www.chris-grieser.de` (?)

## Progress & blockers

### Migration from Fruition (my previous website setup)
1. Export Notion content, delete notion page.
2. Delete Web Worker at CloudFlare from the Fruition setup. Delete CloudFlare
   account with the intention of only Strato for DNS and domain. (To keep the
   number of required pieces to a minimum.)
3. At the Strato dashboard, removed the use of the CloudFlare DNS and configured
   the domain to use Strato's DNS.

> [!NOTE]
> Strato was chosen back then as a service for German domains (`.de`).
> Unfortunately, it seems that the Strato website is only available in German.
> Googling for how to change its language only results in pages on how to
> change *website content* to English, not the Strato dashboard itself. Looking
> at the Strato FAQ and help pages also did not yield any usable results.

### Custom domain setup
- [GitHub docs: Manage custom
  domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site)
- Strato's dashboard only offers `A` and `AAAA` as the type of address.

```bash
# GitHub Pages A addresses
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153

# verify & expected output
$ dig EXAMPLE.COM +noall +answer -t A
> EXAMPLE.COM    3600    IN A     185.199.108.153
> EXAMPLE.COM    3600    IN A     185.199.109.153
> EXAMPLE.COM    3600    IN A     185.199.110.153
> EXAMPLE.COM    3600    IN A     185.199.111.153
```

```bash
# GitHub Pages AAAA addresses
2606:50c0:8000::153
2606:50c0:8001::153
2606:50c0:8002::153
2606:50c0:8003::153

# verify & expected output
$ dig EXAMPLE.COM +noall +answer -t AAAA
> EXAMPLE.COM     3600    IN AAAA     2606:50c0:8000::153
> EXAMPLE.COM     3600    IN AAAA     2606:50c0:8001::153
> EXAMPLE.COM     3600    IN AAAA     2606:50c0:8002::153
> EXAMPLE.COM     3600    IN AAAA     2606:50c0:8003::153
```

> [!NOTE]
> GitHub names for addresses each for `A` and `AAAA`, but `strato.de` only
> accepts one each. Unclear whether this is a problem.

`A` and `AAAA` both have a green check mark at Strato, but GitHub's verification
via `dig` is not (yet?) successful.

```bash
# current output
$ dig EXAMPLE.COM +noall +answer -t A
; <<>> DiG 9.10.6 <<>> chris-grieser.de +noall +answer -t A
;; global options: +cmd

$ dig EXAMPLE.COM +noall +answer -t AAAA
; <<>> DiG 9.10.6 <<>> chris-grieser.de +noall +answer -t AAAA
;; global options: +cmd
```

### DNS check
GitHub's DNS check errors in is unsuccessful with the message: 

> Both chris-grieser.de and its alternate name are improperly configured
> Domain's DNS record could not be retrieved. For more information, see
> documentation (InvalidDNSError).

> [!NOTE]
> It is unclear whether this is an issue or this is due to the 24h-period for
> using Strato's DNS (instead of the one from CloudFlare like previously).

### Domain verification
[Verifying the domain is
recommended.](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/verifying-your-custom-domain-for-github-pages)

> [!NOTE]
> However, the manual refers to buttons that do not exist on the page, e.g.,
> `Add domain` does not exist on the [pages configuration](https://github.com/chrisgrieser/chrisgrieser.github.io/settings/pages).

### SSL encryption
- My package at Strato includes a [basic
  SSL certificate](https://www.strato.de/faq/domains/wie-kann-ich-mein-kostenfreies-strato-ssl-zertifikat-verwenden/).

> [!NOTE]
> Enabling `https` in the GitHub Pages settings is greyed out with the message:
> `Unavailable for your site because your domain is not properly configured to
> support HTTPS (chris-grieser.de)`.

## Info on previous website setup
Information here kept for reference, the website itself does no longer exist.

### How it worked
Components:
- [Notion public sites](http://www.notion.so) &
  [Fruition](https://fruitionsite.com/), for the content.
- [Strato](https://www.strato.de/) for the domain.
- [Cloudflare](http://www.cloudflare.com) was used as DNS service.

I followed the instructions on the Fruition website (which are down at the
moment).

### Past issues with Fruition
* ["Issue with your iOS app" error · Issue #55 ·
	stephenou/fruitionsite](https://github.com/stephenou/fruitionsite/issues/55#issuecomment-1978266460)
* [Doesn't the script work anymore? · Issue #287 ·
	stephenou/fruitionsite](https://github.com/stephenou/fruitionsite/issues/287)
