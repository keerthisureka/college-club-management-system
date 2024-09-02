# Steps to run the project
### Clone the Repository
Clone the repository in this path C://xampp/htdocs/folder_name
```
git clone https://github.com/keerthisureka/college-club-management-system.git
cd college-club-management-system
```

### Install Missing Dependencies
```
composer install
```

### Setup the database
- Start Xampp and MySQL using the xampp control panel
- Create a database named "cems" in phpMyAdmin: [http://localhost/phpmyadmin/](http://localhost/phpmyadmin/)
- Import "cems.sql" file from the repository into this database to create default table structures

### To Install RazorPay
If razorpay-php is not a Composer package or requires manual installation:
- Download the package from the Razorpay [GitHub repository](https://github.com/razorpay/razorpay-php) or from [Razorpay’s website](https://razorpay.com/docs/payments/payment-gateway).
- Extract and place the razorpay-php directory into the root directory of your project.

### Verify and Configure
- <b>Ensure Configuration:</b> Make sure that your project’s configuration files (e.g., config.php or .env) are updated to recognize and work with the newly added razorpay-php.
- Create .env file in the root project directory and add these in the .env file:
  ```
  MAIL_USERNAME=""
  MAIL_PASSWORD=""
  MAIL_NAME=""
  
  RAZORPAY_KEY=""
  RAZORPAY_SECRET=""
  ```
- <b>Update Autoloaders:</b> If necessary, update any autoloaders or include paths in your PHP project to ensure that the new libraries are loaded correctly

### Test Your Setup
Go to the url: [http://localhost/college-club-management-system](http://localhost/college-club-management-system) to access the website

##### Note: admin login (present in the database)
- name: admin
- password: admin
