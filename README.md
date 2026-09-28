# EE292M Worklogs

## Setup (once)
1. Get your API key from https://292m.ee.stanford.edu
2. `cp .env.example .env`, then put your key in `.env`
3. `make check` should print your info and "Key OK"

## Submitting
Name each worklog `worklog-<id>.md` (e.g. `worklog-1a.md`, `worklog-1b.md`, `worklog-2a.md`),
then submit it by id:

    make submit WL=1a
    make submit WL=1b
    make submit WL=2a

Never commit `.env` or share your key.
