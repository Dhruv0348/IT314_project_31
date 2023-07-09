### Note : Refer to the attached PDF file for better formatting and readability.

<p align="center">
  <img src="bin/logo1.png" alt="Logo" width="200" height="200">
</p>


### IT314 Software Engineering

### Lab Session II Course Project Kick-Off Submission
#### Project: Canteen Automation System
#### Prepared by 
#### Team No. 31 | Group 6
#### Group Members


|**202001023 Vandan Patel**|**202001409 Kashyap Panchani**|
| -: | :- |
|**202001271 Dhruv Patel**|**202001415 Pinak Trivedi**|
|**202001403 Jaimin Baurasi**|**202001420 Divya Patel**|
|**202001405 Kenil Vaghasiya**|**202001430 Aryan Shah**|
|**202001407 Karan Patel**|**202001432 Aditya Jadeja**|
|**202001465 Jaykumar Navadiya**|

**Under the guidance of**
**Prof. Khare, Prof. Tiwari and**
**Teaching Assistant : Ankita Ma’am**

**Date** - **February 10, 2023**

### **Index**

1. **Need for the project solution**
1. **Features of the project solution**
1. **Scope of the project**
   1. **Scope of the software**
   1. **Scope of user**
1. **Functional requirements of the project**
   1. **Functional requirements on the customers side**
   1. **Functional requirements on the canteen counter staff side**
1. **Non-functional requirements of the project**
1. **UML Use-case Diagram**
1. **SDLC model  Agile SDLC Model**























### **1. Need for the project solution**

1. **Order Management:** Our daily lives as regular canteen users illustrate that generally the canteen is a very crowded place. There is a great deal of waiting and we have to go through a lot of steps just to track and get our orders.
1. **Data handling:** Managing canteen’s data accurately and maintaining the information up-to-date is a huge task to perform on a regular basis.
1. **Error Complications:** Dealing with the manual errors like orders taken by the cashier of the canteen may be getting calculation mistakes or they may be replacing the sequence of the order taken previously and after is hard to manage.
1. **Review and Enhancement:** Customer review and improving customer experience accordingly is an essential part of any business model which is harder in orthodoxical way of management.
1. **Payment Regulation:** The availability of efficient payment methods like online payments, payments by card or UPI is extremely important in today's world, and it is difficult to manage them efficiently.
1. **Customer Management:** There are times when we encounter confusion as a result of interchanges in the orders of customers. It is necessary to find a solution to this issue.


### **2. Features proposed for the Canteen Automation System**

1. **Menu management:** Administrators will be allowed to manage and update the menu such as addition and deletion of the food item or changing the price of food items.
1. **Order management:** 
   1. Customers would be able to see their order number and also which order is currently being prepared by the canteen so that they can get an idea when their order will get ready.
   1. Customers will be provided one unique QR code per order through which they have to verify their order at the counter so that others can not take their order.
1. **Inventory management:** The canteen staff would be able to monitor the current stock of food items and ingredients, ensuring that the canteen never runs out of food.
1. **Availability of Food:** Users will be able to see which canteen is currently accepting the order and which food item is currently available by that canteen. This will help canteen staff to get only those orders for which they have enough supplies.
1. **Billing and Payment:** Users will get different modes of payments such as UPI, QR code, Offline mode(Cash on delivery).
1. **Daily Statistics:** Canteen staff will be able to see the daily report of their canteen to manage their business more efficiently.
1. **User review:** Users will be able to see and upload the review of their food item that they ordered so that this will be useful to other users.
1. **Search/Filter:** Users will be able to filter their search according to their need such as name/category of food..
1. **Discounts/Offers:** The app must allow special discounts/coupons on some food items to the customer.:
1. **Notification:** Users will get notification when there is something important announcement that the users have to know such as order is prepared/ there is some discount on some food items.

### **3. Scope**

**3.1 Software Scope**


**Canteen Automation System(CAS) is an android/iOS application that helps manage the day-to-day operations of a college canteen. The aim of this system is to streamline the ordering process, and improve overall efficiency. The CMS will provide an easy-to-use platform for students,faculty, and canteen staff to place orders, manage food items, and keep track of inventory.**

This app can allow canteen staff to add new food items to the menu, modify existing food items, and delete food items from the menu. Students and faculty members will be able to place orders through the application, track the status of their orders in real-time, view their order history. The canteen staff will be able to add new inventory items, modify existing inventory items, delete inventory items, track the status of inventory items in real-time. The system will be integrated with a payment gateway to allow students and faculty members to pay for their orders online, view their payment history. The canteen staff will be able to generate reports on orders placed, inventory. The system will have a user-friendly interface that is easy to navigate, responsive and accessible on all devices (desktops, laptops, smartphones, etc.). The Canteen Management System is an essential tool for improving the efficiency of a college canteen. With its advanced features, the system will help streamline the ordering process, manage inventory, and provide an easy-to-use platform for students, faculty, and canteen staff.

**3.2 User Scope**

**Cafeteria Owners **- Cafeteria owners can use the system to manage their business more efficiently and effectively.

**Customers -**

- **Students:** Students residing in the hostel can use the system to order food from the cafeteria more quickly and efficiently.
- **Employees:** Employees working on the campus can use the system to order food from the cafeteria more quickly and efficiently.
- **Visitors:** Visitors can easily use the system to order food from the cafeteria using guest login in the app.



### **4. Functional Requirements:**

**4.1 Canteen Automation system Functional Requirements for customers:**

- An app that can be used on mobile devices such as smartphones and tablets on Android and iOS platforms can help customers order food from their cafeterias more quickly and efficiently.
- Secure login system that can help customers keep their account secure and prevent unauthorized access to their account and personal information such as debit/credit card details and other sensitive information.
- Customers can order food from their cafeteria using the app, check their order status, and receive notifications when their order is ready for pickup. The customer needs to show his/her unique QR code to the cafeteria owner to pick up the order so that no one else can pick up the order.
- Payment for the food can be made using the app through the integrated payment system using a debit card or credit card or scanning the cafeteria's QR code.
- An easy-to-use interface allows users to easily navigate the system and find the food they want to order.
- Features such as search and filter can help customers find the food they want and from the cafeteria they want more quickly.
- Features such as order and payment history can help customers keep track of their orders and payments.
- Recommendation systems with "similar items" and "items you might like" help customers find the food they want more quickly.
- Option to give feedback on the food they ordered and the cafeteria they ordered from so that cafeteria owners can improve their quality of service and other users can make informed decisions about the food they want to order. 



**4.2 Cafeteria Automation system Functional Requirements for cafeteria owners:**

- Secure and separate login systems that can help cafeteria owners keep their accounts secure and prevent unauthorized access to their accounts and personal information such as debit/credit card details and other sensitive information.
- An easy-to-use interface that allows users to navigate through the system quickly.
- Advanced features that can help cafeteria owners manage their businesses more efficiently and effectively such as:
  - Inventory management
  - Sales management
  - Accounting management
- An automated payment system that can help cafeteria owners accept payments from customers more quickly and efficiently.
- A system that can let cafeteria owners change the menu and prices of their food items easily and quickly. 
- The app must allow special offers to customers such as discounts and coupons quickly and easily.

### **5. Non-Functional Requirements** 

**The System being talked about in this section is the canteen automation system.**

1. **Performance:** The system should work faster and the response time of all the functionalities should be less than 400 ms and the application should open in less than 6-8 seconds. Time elapsed between the submission of order by user and the order received by canteen manager should be as minimum as possible.
1. **Scalability:** The system should be easily scalable. The system should be able to respond to the change in the user base and if the need arises, capacity of the system should be scalable. In case of lower demands, the system should decrease the capacity dynamically to lower the costs of the operations.
1. **Reliability:** The system must be able to handle a large number of users (students and faculty) and orders without any performance issues or downtime and must be able to scale up or down according to the needs of the cafeteria owners and customers.
1. **Regulatory -** The system must comply with all the regulations and laws regarding online payments and privacy and security of personal information.
1. **Maintainability -** The system must be easy to maintain and update so that the cafeteria owners can easily make changes to their menu and prices of their food items and the customers can easily give feedback to the cafeteria owners and the system can be updated accordingly to add new features and improve the quality of service.
1. **Serviceability -** The system must be easy to use and navigate so that the cafeteria owners and customers (students and faculty) can use the system more easily and efficiently.
1. **Utility -** The system must provide useful and helpful features that can help cafeteria owners manage their business more efficiently and effectively and can help customers order food from their cafeteria more easily and efficiently.
1. **Security -** The system must be able to keep the personal information of the users secure by encrypting the user data to prevent unauthorized access to their account and personal information such as debit/credit card details and other sensitive information.
1. **Manageability -** The system must be able to manage a large number of users and orders without any performance issues or downtime and must be able to scale up or down according to the needs of the cafeteria owners and customers.
1. **Data integrity -** The system  must be able to keep the data secure and prevent unauthorized access to the data.
1. **Capacity -** The system must be able to handle a large number of users (around 500) and orders without any performance issues or downtime and must be able to scale up or down according to the needs of the cafeteria owners and customers.
1. **Availability -** The system must be available all the time so that the cafeteria owners and customers can use the system whenever they want. Multiple deployments can be made of the system for lowering the downtime of the system.
1. **Usability -** The system must be easy to use and navigate so that the cafeteria owners and customers can use the system more easily and efficiently.
1. **Interoperability -** The system must be able to work with different payment systems such as debit cards, credit cards and UPI.
1. **Environmental -** The system must be energy efficient and should not have any negative impact on the environment.
1. **Familiarity -** The system should be familiar to other apps (like zomato, swiggy) for the users to be easily able to go through the steps for ordering food from the canteen.
1. **Robustness -** If the connection between the user and the system is broken prior to an order being either confirmed or canceled, the automation system shall enable the user to recover an incomplete order.
1. **Flexibility -** The automation system should be flexible enough to easily make changes in it.
1. **Portability:** The system must work on any mobile device, such as smartphones and tablets, on both Android and iOS platforms.
1. **Disaster recovery:** In case of a disaster, the system must be able to recover from the disaster. In the worst-case scenario, it must be able to recover payment information and other sensitive information for the users and cafeteria owners so that they can continue using the system without any issues.


### **6. Use-Case Diagram:** 

![use-case-diagram](https://user-images.githubusercontent.com/67496808/218147866-cacff3e8-6b4d-468a-8a28-b468b74c3598.png)



### **7. SDLC model  Agile SDLC Model**

![image](https://user-images.githubusercontent.com/67496808/218148138-a67ed267-bc49-47da-96d6-976fd7282902.png)


After a thorough examination of the requirements and features of our Canteen Automation System, we have determined that the **Agile Software Development model** is the most suitable software development life cycle model for this project. The following are the reasons behind our choice of the Agile model:

1. **Iterative and incremental approach:** The Agile model is ideal for projects with rapidly evolving or undefined requirements due to its iterative and incremental approach to software development. This approach allows the development team to collaborate with customers to identify the most important features to be delivered first and then build on them as the project advances. Our project, Canteen automation system may have many versions of it because of the larger team size and various features. Due to one way development of the waterfall model, it would be highly inefficient to work on this big project with the waterfall model. 
1. **Flexibility:** The Agile model is highly adaptable, enabling the development team to quickly respond to changes in the requirements or any other project factors. This characteristic is essential for the Canteen Automation System, as the needs of the system may shift during the development and testing process.
1. **Collaboration and communication:** The Agile approach fosters collaboration and communication among team members and stakeholders, which is crucial for the success of the Canteen Automation System project. By utilizing Agile methodologies, the development team can collaborate closely with stakeholders and make decisions swiftly and efficiently.
1. **Emphasis on working software:** The Agile approach prioritizes the swift delivery of functional(working)  software to stakeholders, crucial for the Canteen Automation System to adapt to the changing needs of its users.
1. **Time and cost-efficient:** The Agile model prioritizes efficiency in terms of time and cost, as it facilitates swift changes and focuses on delivering the most crucial features first. This helps guarantee that the Canteen Automation System will be completed within the set timeframe and very low (nearly 0) budget.
1. **Time-to-Market:** Agile methodologies allow for a faster time-to-market for the software, which is crucial for our project as the demand for the software may be high and time-sensitive.

Overall, the Agile software development model is a good choice for the Canteen Automation System because it provides a flexible, collaborative, time and cost efficient, iterative approach to software development that will help to ensure the successful delivery of the system.

When compared to the waterfall model, we can not start developing the canteen automation system from day 1 as it requires a complete documentation and then only we can start developing. That is the reason why we chose the agile SDLC model.

**References:-** 

1. <https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.javatpoint.com%2Fsoftware-engineering-agile-model&psig=AOvVaw3vyUD_rIaOixT18sqiCsC8&ust=1676110911663000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCKD42e7div0CFQAAAAAdAAAAABAD> - Image of Agile SDLC Model



