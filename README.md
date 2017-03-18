# Looker Data Dictionary Builder

A quick and easy way to export an HTML data dictionary from your Looker models via our API.

## Requirements

- Looker
- Git
- Ruby

## Usage

Clone this repo:

```
git clone https://github.com/looker/data-dictionary-builder.git
```

Move to the directory:

```
cd data-dictionary-builder
```

Make sure everything's installed:

```
bundle
```

Run the builder with your credentials:

```
LOOKER_CLIENT_ID=1234567 LOOKER_CLIENT_SECRET=1234567 LOOKER_ENDPOINT=https://mycompany.looker.com/api/3.0 LOOKER_URL=https://mycompany.looker.com ./bin/data-dictionary-builder
```

This will export a set of pages containing your data dictionary!
