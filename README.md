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

Your credentials and configuration can be provided by environment variables.

For your convenience you can create a text file called `.env` in `data-dictionary-builder` folder to specify the configuraion as well. Here's a sample `.env`:

```
LOOKER_URL=https://mycompany.looker.com
LOOKER_ENDPOINT=https://mycompany.looker.com/api/3.0
LOOKER_CLIENT_ID=1234567
LOOKER_CLIENT_SECRET=1234567
```

Then run the tool:

```
bundle exec bin/data-dictionary-builder my_model_name my_explore_name
```

This will export a set of pages containing your data dictionary!
