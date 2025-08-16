# Rails Blog App

A simple blog application built with Rails 7, Hotwire, and Tailwind CSS. This app is designed to work seamlessly with the Hotwire Native Android app.

## Features

- ✅ Create, read, update, and delete posts
- ✅ Add comments to posts in real-time using Turbo Streams
- ✅ Responsive design with Tailwind CSS
- ✅ Hotwire/Turbo enabled for SPA-like experience
- ✅ Mobile-friendly and ready for Hotwire Native

## Requirements

- Ruby 3.0+ (or use the system Ruby with sudo for gem installations)
- Bundler
- SQLite3
- Node.js (for Tailwind CSS)

## Setup

1. **Install dependencies**:
   ```bash
   cd rails-app
   bundle install
   ```

2. **Setup the database**:
   ```bash
   bundle exec rails db:create
   bundle exec rails db:migrate
   ```

3. **Install Tailwind CSS**:
   ```bash
   bundle exec rails tailwindcss:install
   ```

4. **Start the Rails server**:
   ```bash
   bundle exec rails server
   ```

   The app will be available at `http://localhost:3000`

## For Android Development

When testing with the Android app:

1. **For Android Emulator**:
   - Keep the Rails server running on `http://localhost:3000`
   - The Android app should connect to `http://10.0.2.2:3000`

2. **For Physical Device**:
   - Find your computer's IP address:
     ```bash
     # On Mac
     ifconfig | grep "inet " | grep -v 127.0.0.1
     
     # On Linux
     hostname -I
     ```
   - Start Rails server binding to all interfaces:
     ```bash
     bundle exec rails server -b 0.0.0.0
     ```
   - Connect from Android app using `http://YOUR_COMPUTER_IP:3000`

3. **Using ngrok (Recommended for testing)**:
   - Install ngrok: `brew install ngrok` (Mac) or download from ngrok.com
   - Start Rails server normally
   - In another terminal: `ngrok http 3000`
   - Use the HTTPS URL provided by ngrok in your Android app

## Project Structure

```
rails-app/
├── app/
│   ├── controllers/      # Posts and Comments controllers
│   ├── models/           # Post and Comment models
│   ├── views/            # ERB templates with Turbo Frames
│   └── javascript/       # Stimulus controllers
├── config/
│   ├── routes.rb         # Application routes
│   └── database.yml      # Database configuration
├── db/
│   └── migrate/          # Database migrations
└── Gemfile              # Ruby dependencies
```

## Key Files to Modify

1. **Adding new features**: Start with routes in `config/routes.rb`
2. **Styling**: Edit Tailwind classes in view files or `app/assets/stylesheets/application.tailwind.css`
3. **Real-time updates**: Use Turbo Streams in controllers and views
4. **Mobile optimization**: Test all features in the Android app

## Development Tips

- The app uses SQLite for simplicity, perfect for development
- Turbo Frames are used for modals (new/edit post forms)
- Turbo Streams handle real-time comment updates
- All forms work without JavaScript (progressive enhancement)

## Troubleshooting

1. **Bundle install fails**: Try `sudo gem install bundler` first
2. **Database errors**: Run `bundle exec rails db:reset` to recreate database
3. **Tailwind not working**: Run `bundle exec rails tailwindcss:build`
4. **Can't connect from Android**: Check firewall settings and ensure Rails is bound to 0.0.0.0