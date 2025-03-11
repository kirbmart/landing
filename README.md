# CURATO - Modern B2B Wholesale Marketplace

CURATO is a modern B2B wholesale marketplace that connects independent retailers with brands/makers. The application features a sleek, Arc browser-inspired design with gradient text, clean backgrounds, and modern UI elements.

## Features

- Modern, responsive design using Tailwind CSS
- Arc browser-inspired UI with gradient text and clean aesthetics
- Email capture form with validation
- User type selection (brand/maker or retailer)
- AJAX form submission
- Email confirmation to subscribers
- Basic spam protection
- Analytics tracking

## Screenshots

*Note: Add screenshots of your application here. The `public/screenshots` directory has been created for this purpose.*

## Technical Stack

- Ruby on Rails 8.0.1
- PostgreSQL
- Tailwind CSS 4.0.12
- Stimulus JS
- Turbo

## Setup

1. Clone the repository
   ```
   git clone https://github.com/kirbmart/landing.git
   cd landing
   ```

2. Install dependencies:
   ```
   bundle install
   ```

3. Set up the database:
   ```
   rails db:create db:migrate
   ```

4. Start the server:
   ```
   bin/dev
   ```

5. Visit `http://localhost:3000` in your browser

## Database Schema

The application uses a PostgreSQL database with the following schema:

### Leads Table

- `email` (string, required, unique)
- `company_name` (string, optional)
- `user_type` (string, either 'brand' or 'retailer')
- `ip_address` (string, for spam prevention)
- `utm_source` (string, for tracking)
- `utm_medium` (string, for tracking)
- `utm_campaign` (string, for tracking)
- `utm_term` (string, for tracking)
- `utm_content` (string, for tracking)
- `created_at` (timestamp)
- `updated_at` (timestamp)

## Design

The design has been updated from a Moon Juice aesthetic to a modern Arc browser-inspired design:

- **Color Palette**: Modern purple gradient with clean backgrounds
- **Typography**: Modern sans-serif fonts with gradient text effects for headings
- **UI Elements**: Updated buttons, cards, and dividers with new styles
- **Visual Effects**: Animations and gradient backgrounds for a cleaner look

## Testing

To test the application:

1. Run the test suite:
   ```
   rails test
   ```

2. To test the form submission:
   - Visit the landing page
   - Fill out the form with valid information
   - Submit the form
   - Verify that a success message is displayed
   - Check the database to ensure the lead was created

3. To verify email sending:
   - In development, emails are sent to the log
   - Check the server logs to see the email content

## Troubleshooting

If you encounter database connection issues:

1. Ensure PostgreSQL is running
2. Create the development database:
   ```
   rails db:create
   ```
3. Run pending migrations:
   ```
   rails db:migrate
   ```

If the server is already running when you try to start it:
```
rm -f tmp/pids/server.pid
```

## Deployment

The application can be deployed to any platform that supports Ruby on Rails applications, such as Heroku, Render, or Fly.io.

## License

This project is licensed under the MIT License.
