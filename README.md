# Hacker News Reader

A Flutter-based Hacker News Reader app built using Clean Architecture and Riverpod.

## Features

* Top Stories Feed
* Story Detail Screen
* Nested Comments
* Pull To Refresh
* Hacker News Styled UI
* URL Launching
* Recursive Comment Rendering

## Tech Stack

* Flutter
* Riverpod
* Dio
* GoRouter
* Clean Architecture

## API Used

* https://hacker-news.firebaseio.com/v0/topstories.json
* https://hacker-news.firebaseio.com/v0/item/<id>.json

## Folder Structure

```txt
lib/
├── core/
├── features/
├── routes/
└── main.dart
```

## Run Project

```bash
flutter pub get
flutter run
```

## Screens

### Home Screen

Displays top Hacker News stories with:

* Title
* Domain
* Score
* Author
* Comment Count

### Detail Screen

Displays:

* Story details
* Nested comments
* Recursive replies
* Open article functionality

## Architecture

This project follows Clean Architecture principles with:

* Data Layer
* Presentation Layer
* Repository Pattern
* Riverpod State Management
