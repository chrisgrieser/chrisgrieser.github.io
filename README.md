# Setup information

<!-- toc -->

- [Learnings](#learnings)
- [Information on the domain](#information-on-the-domain)
- [Custom domain for GitHub Pages](#custom-domain-for-github-pages)
  * [A & AAAA records](#a--aaaa-records)
  * [CNAME record](#cname-record)
  * [Domain verification (TXT record)](#domain-verification-txt-record)
- [Content for GitHub Pages](#content-for-github-pages)
- [Previous website setup](#previous-website-setup)
  * [How it worked](#how-it-worked)
  * [Past issues with Fruition](#past-issues-with-fruition)

<!-- tocstop -->

## Learnings
- The file [CNAME](./docs/CNAME) contains the domain name.
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

## Information on the domain
<https://chris-grieser.de/>
- bought via [Strato](https://www.strato.de/apps/CustomerService)
- apparently does not include `www.chris-grieser.de`
- Allows up to 10 subdomains, however due to Strato only allowing one `A` and
  `AAA` record, it is not possible to use any subdomains with GitHub pages
  (`subdomain.chris-grieser.de`). Sub*sites* though should still be possible
  (`chris-grieser.de/subsite`).
- My package at Strato includes a [basic SSL
  certificate](https://www.strato.de/faq/domains/wie-kann-ich-mein-kostenfreies-strato-ssl-zertifikat-verwenden/).
  It does only offer encryption for the main domain, not any subdomains.
  However, due to using GitHub pages, it's the site uses the certificate from
  "Let's encrypt" (the provider used by GitHub).

## Custom domain for GitHub Pages
- [GitHub Pages docs: Quickstart](https://docs.github.com/en/pages/quickstart)
- [GitHub Pages docs: Manage custom
  domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/managing-a-custom-domain-for-your-github-pages-site)
- Using Strato as domain and as DNS provider.

> [!NOTE]
> When doing DNS changes, [removing and re-adding the custom
> domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/troubleshooting-custom-domains-and-github-pages#https-errors)
> in the `Pages` settings may be required.

### A & AAAA records
- Strato's domain config only offers `A` and `AAAA` as the type of address.
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

### CNAME record
- At the Strato dashboard, set the CNAME for the domain, pointing
  `www.chris-grieser.de` to `chrisgrieser.github.io`.
- Having both A/AAAA records and the CNAME record set up results in passing
  GitHub's DNS check (at the page settings).

> [!TIP]
> GitHub uses a `CNAME` file to store the custom domain name in the repository.
> The "CNAME" mentioned in the GitHub documentation, however, refers to the
> CNAME *record* at the DNS provider.

### Domain verification (TXT record)
- [GitHub docs: Verifying a custom domain](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/verifying-your-custom-domain-for-github-pages#verifying-a-domain-for-your-user-site)
	* Note: the `Pages` settings mentioned in the docs refer to the settings in
	  the GitHub *profile*, not the `Pages` settings of the `*.github.io`
	  *repository*. (That is, the verification is done here:
	  <https://github.com/settings/pages>.)
- At the Strato dashboard, set the TXT for the domain, pointing
  `_github-pages-challenge-chrisgrieser.chris-grieser.de` to the `{value}`
  listed on the page.

```bash
# additional confirmation
dig _github-pages-challenge-chrisgrieser.chris-grieser.de +nostats +nocomments +nocmd TXT

# expected output
_github-pages-challenge-chrisgrieser.chris-grieser.de. 150 IN TXT "{value}"
```

## Content for GitHub Pages
- [Setting title and
  description](https://docs.github.com/en/pages/quickstart#changing-the-title-and-description)
- [Adding
  content](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/adding-content-to-your-github-pages-site-using-jekyll)
- [Jekyll docs](https://jekyllrb.com/docs/front-matter/)

## Theme
Are set in the [`_config.yml`](./docs/_config.yml) file.

```yaml
# Builtin themes for GitHub Pages: https://pages.github.com/themes/
theme: jekyll-theme-modernist
```

```yaml
# Remote themes, allowing any Jekyll theme: https://jekyllrb.com/docs/themes/
plugins: [jekyll-remote-theme]
remote_theme: pages-themes/modernist@v0.2.0
```

## Previous website setup
*Information here kept for reference, the website itself does no longer exist.*

### How it worked
Components:
- [Notion public sites](http://www.notion.so) &
  [Fruition](https://fruitionsite.com/) for the content.
- [Strato](https://www.strato.de/) for the domain.
- [Cloudflare](http://www.cloudflare.com) was used as DNS service.

I followed the instructions on the Fruition website.

### Past issues with Fruition
- ["Issue with your iOS app" error · Issue #55](https://github.com/stephenou/fruitionsite/issues/55#issuecomment-1978266460)
- [Doesn't the script work anymore? · Issue #287](https://github.com/stephenou/fruitionsite/issues/287)
