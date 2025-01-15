# ExactRx

ExactRx is a patient management system built using Ruby on Rails, designed to help providers manage patient information and appointments efficiently. The application leverages a variety of tools and technologies, including authentication, pagination, and an interactive user interface for a smooth experience.

## Features

- **Patient CRUD**: Add, view, update patient records.
- **User Authentication**: Login, and secure patient management using **Devise**.
- **Pagination**: Paginate patient lists for better navigation using **Kaminari** and **Kaminari Bootstrap**.
- **Bootstrap & Simple Form**: For responsive and easy-to-use form layouts.
- **Search Functionality**: Efficient searching for patients.
- **Custom Styling**: Enhanced UI with **Bootstrap** and **Sass** for a polished look.

## Technologies Used

- **Ruby on Rails**: Backend framework
- **Devise**: For user authentication
- **Kaminari**: For paginating lists
- **Bootstrap 5**: For frontend styling and responsive design
- **Simple Form**: For easy form handling
- **jQuery**: For enhanced frontend functionality
- **RSpec, Capybara, Factory Bot**: For testing
- **Faker**: For generating test data

## Installation

### Prerequisites

- Ruby (version `3.0.0` or higher)
- Rails (version `7.1.5` or higher)
- PostgreSQL for database management
- Node.js and Yarn (for managing frontend dependencies)

### Steps to Set Up

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/ankitrathoretech/patient_management.git
   cd patient_management

2. **Install Ruby and Rails Dependencies:**

   ```bash
   bundle install

3. **Set Up Database:**

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed  # This will populate the database with sample data

4. **Install JavaScript Dependencies:**

    ```bash
    yarn install

5. **Start rails server:**

    ```bash
    rails s


Now visit http://localhost:3000 in your browser to see the application in action.


## Usage

- **Authentication**: Log in using Devise (default credentials are **email:** user@gmail.com and **password:** user123).
- **Patients Management**: View and manage patient records.
- **Appointments**: Schedule and view patient appointments.
- **Pagination**: The list of patients will be paginated for easier navigation.

## Testing

    bundle exec rspec


## Open the coverage report:

```bash
open coverage/index.html

or

xdg-open coverage/index.html



