# Makersbnb

## User stories

### MVP User stories
```
As a user
So I can have my details saved
I can sign up to Makersbnb

As a user
So I can access my Makersbnb session
I can log in to Makersbnb

As a user
So I can get out of my Makersbnb session
I can log out to Makersbnb

As a user
So I can have my spaces saved
I can list a new space while signed up

As a user
So I can have more than one spaces saved
I can list several spaces while signed up

As a user
So I can identify my spaces
I can name my spaces

As a user
So I can store details about my spaces
I can provide descriptions of my spaces

As a user
So I can display the price of my spaces
I can provide a price per night for my spaces

As a user
So I can see what spaces are available
I can see a list of spaces with names, descriptions and prices
```

### Extra user stories

```
As a user
So I can change the details of my spaces
I can edit the details of my spaces

As a user
So I can remove my spaces from the website
I can delete my spaces

As a user
So I can display available nights for my spaces
I can provide a range of dates where my spaces are available

As a user
So I can reserve a space
I can request to book a space for a night

As a user
So I can see requests of booking my spaces
I can view requests that has been made for each of my spaces

As a user
So I can confirm requests
I can approve requests of booking each of my spaces

As a user
So I can deny requests
I can deny requests of booking each of my spaces

As a user
So I can know the dates of each spaces available
I can see when a space has been booked and is not available

As a user
So I can keep requests open for my spaces
I can receive booking requests for my spaces until I have confirmed one for each given night
```

## Database Domain Modelling

![Database domain Modelling](https://github.com/Maldorana/Makersbnb/blob/main/Database%20domain%20modeling.png)

## Wireframes

![Wireframes](https://github.com/Maldorana/Makersbnb/blob/main/wireframes.png)

## MakersBnB specification

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

### Headline specifications

- Any signed-up user can list a new space.
- Users can list multiple spaces.
- Users should be able to name their space, provide a short description of the space, and a price per night.
- Users should be able to offer a range of dates where their space is available.
- Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
- Nights for which a space has already been booked should not be available for users to book that space.
- Until a user has confirmed a booking request, that space can still be booked for that night.

### Nice-to-haves

- Users should receive an email whenever one of the following happens:
 - They sign up
 - They create a space
 - They update a space
 - A user requests to book their space
 - They confirm a request
 - They request to book a space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- Users should receive a text message to a provided number whenever one of the following happens:
 - A user requests to book their space
 - Their request to book a space is confirmed
 - Their request to book a space is denied
- A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- Basic payment implementation though Stripe.

### Mockups

Mockups for MakersBnB are available [here](https://github.com/makersacademy/course/blob/main/makersbnb/makers_bnb_images/MakersBnB_mockups.pdf).
