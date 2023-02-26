# Flask App

This is a simple Flask application that allows users to register, log in, and view and edit their profiles. The application also allows users to view and purchase products in different categories.

## Requirements

To run the Flask app, you will need the following:

-   Python 3.9
-   Flask 2.1.0
-   SQLite3
-   Git

## Installation

To install the Flask app, follow these steps:

1.  Clone the repository from GitHub:


`git clone https://github.com/your-username/your-repository.git`

2.  Install the required Python packages:


`pip install -r requirements.txt`

3.  Create the database:

`python createdb.py`

4.  Start the app:

`flask run`

The app should now be running on [http://localhost:5000](http://localhost:5000/).

## Usage

To use the Flask app, follow these steps:

1.  Open a web browser and go to [http://localhost:5000](http://localhost:5000/).
    
2.  Register for a new account by clicking the "Register" link on the home page and filling out the registration form.
    
3.  Log in to your account by clicking the "Login" link on the home page and entering your email and password.
    
4.  View and edit your profile by clicking the "Profile" link on the home page.
    
5.  View and purchase products by clicking the "Shop by Category" link on the home page.
    

## Building and Running the Docker Container

To build and run the Flask app in a Docker container, follow these steps:

1.  Install Docker on your system if you haven't already.
    
2.  Clone the repository from GitHub:

`git clone https://github.com/your-username/your-repository.git`

3.  Build the Docker container:

`docker build -t flask-app .`

4.  Run the Docker container:

`docker run -p 4000:4000 flask-app`

The app should now be running on [http://localhost:4000](http://localhost:4000/).
