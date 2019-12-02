# crypto_tracker

A Flutter app made for tracking the current most important cryptocurrencies .

## Features

### List of cryptocurrencies

The list of cryptocurrencies was implemented with the need for constant updates on their information, considering that, the widgets representing each cryptocurrency were implemented using an "onDemand" approach, meaning that only the cryptocurrencies showing on the screen will be constantly updating, also, each widget has its own lifecycle, which means that they are completely independent from one another and their information will be updated as soon as the api request completes.

### Current price and percentage change in the last 24h

The widgets were implemented as proposed on the figma documentation.

### API to get pricing and percentage change

The API chosen for this implementation was not the proposed one, instead the app uses CoinCap Api for some reasons:

- This API has no limit on free requests
- It doesn't require registration on any kind of API_KEY usage
- It provides the easiest way to get the Images of the cryptocurrencies
- Clear documentation

Links:

- website: https://coincap.io/
- Documentation: https://docs.coincap.io/?version=latest#ee30bea9-bb6b-469d-958a-d3e35d442d7a

### Remove a cryptocurrency

The delete method was implemented using a slide to the right on each cryptocurrency tile of the list

### Pricing and percentage change update

To give the impression of a streamming source of information, 2 ways of refreshing the information were implemented

- pull to refresh: anywhere on the list, just pull to refresh and the list will refresh its data.
- periodical calls to the api: a flutter built in method(Timer.periodic()) was used, ensuring that every 10 seconds the data will update on each tile of the list.

## Additional Information

The code was implemented thinking mostly on reusability and maintainability.

Some details on the design were changed, as previously allowed on the challenge documentation, for example:

- to increase the user experience, in the case of the delete button.
- to match the api search tools, in the case of the hint to the TextField on the Add screen.

#### design

Atomic design, with a few modifications, was the chosen one for this project.

    Link: http://atomicdesign.bradfrost.com/

Bloc+Provider pattern was the chosen architecture, As suggested by the Flutter team.

    Link: https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple

Karma commits was the chosen pattern for the commit messages.

    Link: http://karma-runner.github.io/3.0/dev/git-commit-msg.html
