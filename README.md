# B2B Wholesale Marketplace Landing Page

This is a landing page for a B2B wholesale marketplace that connects independent retailers with brands/makers. The application is built with Ruby on Rails, PostgreSQL, and Tailwind CSS.

## Features

- Responsive design using Tailwind CSS
- Email capture form with validation
- User type selection (brand/maker or retailer)
- AJAX form submission
- Email confirmation to subscribers
- Basic spam protection
- Analytics tracking

## Technical Requirements

- Ruby on Rails
- PostgreSQL
- Tailwind CSS

## Setup

1. Clone the repository
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

## Deployment

The application can be deployed to any platform that supports Ruby on Rails applications, such as Heroku, Render, or Fly.io.

## License

This project is licensed under the MIT License.
