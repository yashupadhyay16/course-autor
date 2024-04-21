# Course and Tutor API

This is a Ruby on Rails application that provides APIs for managing courses and their tutors.

## Setup


```bash
1. Clone this repository to your local machine:
git clone <repository-url>

2. Navigate to the project directory:
cd course-and-tutor-api

3. Install the dependencies:
bundle install

4. Set up the database:
rails db:create
rails db:migrate

5. Start the Rails server:
rails server
```

# Usage

## Creating a Course with Tutors
Endpoint: POST `/courses`

Request Body: JSON object with course information and an array of tutor information.Example

```sh
{
  "course": {
    "name": "Course Name",
    "tutors_attributes": [
      { "name": "Tutor 1", "expertise": "Expertise 1" },
      { "name": "Tutor 2", "expertise": "Expertise 2" }
    ]
  }
}
```

## Listing all Courses with Tutors
Endpoint: GET `/courses`

## Postman Collection
You can import the Postman collection provided in the postman directory to quickly test the APIs.

1. Open Postman.
2. Click on "Import" button.
3. Choose "Import From Link".
4. Paste the following link: [Collection-link][]

  [Collection-link]: https://api.postman.com/collections/28881076-017c7f97-4bfd-4467-bb88-d65bbbd4d4a7?access_key=PMAT-01HW0E4N1E1NF8FZX6AA49RSYR
5. Click on "Import".
