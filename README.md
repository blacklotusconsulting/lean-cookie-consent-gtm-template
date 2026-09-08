# Lean Cookie Consent GTM Template

Google Tag Manager custom tag template for Lean Cookie Consent.

The template loads the Lean Cookie Consent SaaS embed using a public Site Key:

```text
https://api.leancookieconsent.com/embed.js?site=<SITE_KEY>
```

## Status

Draft v0.1.0 for GTM Community Template Gallery preparation.

Internal validation completed:

1. Imported `template.tpl` into a GTM web container.
2. Saved the custom template in GTM Template Editor.
3. Created a Lean Cookie Consent tag using **Consent Initialization - All Pages**.
4. Previewed on `https://gtm-test.blacklotus.eu/?gtm=GTM-5NT4JW92`.
5. Published test container `GTM-5NT4JW92` version 2.
6. Confirmed live load, banner rendering, and Consent Mode default `denied`.

Before Community Template Gallery submission:

1. Publish this repository publicly on GitHub.
2. Submit the repository URL through the GTM Community Template Gallery.

## Fields

- **Site Key**: public Lean Cookie Consent Site Key.
- **Set Google Consent Mode default state to denied**: sets default Consent Mode state before loading Lean.
- **Consent Mode wait_for_update**: optional delay for Google tags while the consent banner loads.
- **Debug mode**: logs a short message in GTM preview/debug environments.

## Recommended Trigger

Use **Consent Initialization - All Pages**.

This lets the template set Consent Mode defaults before normal pageview and marketing tags fire.

## Permissions

The template requests:

- script injection for `https://api.leancookieconsent.com/embed.js*`;
- write access to Google Consent Mode consent types used by the default denied state;
- debug logging.

## External Service

This template loads Lean Cookie Consent from:

- `https://api.leancookieconsent.com/embed.js`

The loaded Lean runtime then fetches public configuration and records visitor consent choices for the configured Site Key. See the Lean Cookie Consent privacy policy and terms:

- https://leancookieconsent.com/privacy-policy
- https://leancookieconsent.com/terms

## License

Apache License 2.0. Required for Google Tag Manager Community Template Gallery submissions.