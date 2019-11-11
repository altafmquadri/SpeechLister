# Voice-Activated Reminder App boiii

## User Stories

* As a user, I can create a list of tasks on a given day

  * As a user, I can create a task with
    1. voice input
    2. text input

  * I can edit a task using my voice

  * I can set a task to a specific date using voice input

  * I can view all of my tasks over
    1. a year
    2. a month
    3. a day

* As a user I can view all of my or another user's lists ( select dropdown of lists )

### Stretch GOAL

* As a user I can create a list of a pre-determined type and share that list with another user

## Front-End functionality

* Default view should be Today's date

* Top left should feature a dynamic button depending on current view of [day, week, month, year] => [week, month, year, select[year]]
  * Button click should change the current view to the view in the button

* In year view, there should be a dropdown of all years starting from 2019 + 5 from date.

* Month, week, and daily views should display day of the week.

## API endpoints

* Create a new list
  * POST /lists
    * body includes:
      * type

* Create a new task
  * POST /tasks
  * body includes:
    * date => defaults to today
    * List_id
    * content_body

* Read lists by date and user
  * GET /lists?year={}&user={}

* Update tasks by id (complete the task)
  * POST /tasks/:id
    * body includes:
    * completed
  * PATCH /tasks/:id
    * body includes:
      * new content_body

* delete a list
  * DELETE /lists/:id

* delete a task
  * DELETE /tasks/:id

## Back-End Models

* List
  * has many tasks (tasks)
  * has many tasks
  * Has a type:
    ```ruby
    class Task
      TASK_TYPE = %w[grocery to_do personal]
    end
    ```

* Task
  * belong to a list
  * belongs to a user
  * Has a date
  * Has content body

* User
  * have a name, zero authentication
  * unique username

### Stretch

* shared_lists
  * list_id
  * sharee_id (belongs_to :user, as: :sharee)