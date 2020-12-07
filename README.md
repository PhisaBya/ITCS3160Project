# ITCS3160Project
GROUP Members: Phisa Bya, Samuel Carson, William Faulkner, Jake Garcia, Milan Thakkar

**Table of Contents**

**Introduction (Team, Project Description)**
In this project, we are taking an existing database that represents the ordering system of a campus delivery app and adding additional functionality in the form of a rating system for the application. This database already includes information on the people on campus that could use the app or be drivers for the delivery service such as students and faculty. We can use the existing information to verify whether a person can be a driver (is a student and has a license/car). We can also provide information on the restaurants that use the app (including name,  location...etc). The final piece of the application which we will have to implement is a rating system for both the drivers and the restaurants so that users can provide feedback about their experience with individual drivers and restaurants, we can also then take this rating information and display it to other users to better inform them about the quality of service from each driver and restaurant within the delivery service\
**Use Case for Rating System**
![Use case (2)](https://user-images.githubusercontent.com/46977818/99899190-57288080-2c75-11eb-9157-a4c3161c65be.jpg)\
**Business Rules** \
-Drivers must have drivers license and car.\
-Only students can be drivers.\
-Customers can rate both the driver and restaurant once they have received their food.\
-Customer cannot rate drivers or restaurant they have not used\
-Customer can view the average restaurant and driver ratings when placing an order\
-The rating system will be a numerical rating system from 1-5 (poor service to great service)\
-Drivers and restaurants are able to see their current rating, but are not able to submit a rating about themselves.\
-Drivers are able to become customers when not delivering and as such are able to rate restaurants and other drivers, they however are still prohibited from rating themselves even when acting as a customer.\
-Customers may only give one rating per rate-able object per order, i.e. the customer can only rate the driver and restaurant associated with their current order. \
-Customers may also leave an additional rating on the same driver and restaurant, if they place a new order from the same driver and restaurant combo.\
-They can rate other drivers and other restaurants if they place a new order with a new driver and restaurant combo. \
-Faculty members must have a college degree  \
-Each order must have a total price and a person they are delivering to\
-Restaurants need to have a name\
-Students must have a major\
-Restaurants must be approved by admin before they can be added to the database

**EERD (full database)** 
![EERD Diagram](https://user-images.githubusercontent.com/29802691/99917504-bc648c00-2cde-11eb-99d6-e77224df4052.png)

**Data Dictionary**\
![Data Dictionary 12-6](https://user-images.githubusercontent.com/29802691/101307788-46037600-3816-11eb-8a5a-41a78f63a9c9.png)

Narrative: There are many important relationships in this database - here are a few: The first relationship is the relationship between person and staff, faculty and student. There is a one-to-many relationship beteween person and staff, person and faculty and person and student. A staff can only be one person yet a person can refer to many staff. This same relatinship is seen with student and driver, where a student ID can reference many drivers while a driver can only reference one student. In regards to vehicle and driver, it makes sense for a vehicle to reference many drivers but a driver can only reference on vehicle. There a few items that still need to be implemented - when an order is placed, the attributes of person_id and location_id must initially be filled out, along with total_price and delivery_charge once the user places their order. Before an order is placed, the user is able to see the average ratings of each driver and each restaurnt, influencing their decisions. Once a user places their order and they receive it, they have the option to rate the driver and restaurant based on delivery service and food quality respecitively. This rating system (through the use of stored procedures) is more closely examined down below. 

**MySQL Queries**

![restaurant](https://user-images.githubusercontent.com/29802691/101308508-08075180-3818-11eb-8796-cffbc142d6ad.PNG)

![staff](https://user-images.githubusercontent.com/29802691/101308509-08075180-3818-11eb-91a3-b946bbdeed14.PNG)

![student](https://user-images.githubusercontent.com/29802691/101308510-08075180-3818-11eb-9435-bd2af59a00a4.PNG)

![vehicle](https://user-images.githubusercontent.com/29802691/101308513-08075180-3818-11eb-8c4c-b8b33e6a2ffd.PNG)

![faculty](https://user-images.githubusercontent.com/29802691/101308514-089fe800-3818-11eb-9a6e-71d0948eda21.PNG)

![location](https://user-images.githubusercontent.com/29802691/101308517-089fe800-3818-11eb-9760-9cad69b0ee55.PNG)

![order](https://user-images.githubusercontent.com/29802691/101308518-089fe800-3818-11eb-8449-3e64586cbe91.PNG)

![person](https://user-images.githubusercontent.com/29802691/101308519-089fe800-3818-11eb-9d4a-71c28ab877c0.PNG)

**Stored Procedure**\
-----There are four stored procedures-----

Calculate average of restaurant ratings:\

![calcrestaurant code](https://user-images.githubusercontent.com/29802691/101305242-38e38880-3810-11eb-9478-1b2be25f7950.PNG)

-Calling the procedure:
![calc restaurant average](https://user-images.githubusercontent.com/29802691/101304958-7eec1c80-380f-11eb-881a-8fc82693ace1.PNG)

Update restaurant_rating value in table:

![updaterestaurant code](https://user-images.githubusercontent.com/29802691/101305266-4862d180-3810-11eb-8338-83b71e011c0d.PNG)

Calling the procedure:\
![update restaurant average](https://user-images.githubusercontent.com/29802691/101305005-9a572780-380f-11eb-8957-52453809548f.PNG)

Calculate average of driver ratings:

![image](https://user-images.githubusercontent.com/29802691/101305999-d7241e00-3811-11eb-9ddc-bb82f50fc3f8.png)

-Calling the procedure\
![calc driver average](https://user-images.githubusercontent.com/29802691/101305659-29b10a80-3811-11eb-8124-e6e91832c950.PNG)

Update driver_rating in table:

![updatedriveraveragecode](https://user-images.githubusercontent.com/29802691/101306058-f458ec80-3811-11eb-8b74-728b279f8073.PNG)


Calling the procedure
![calling updatedriveraverage procedure](https://user-images.githubusercontent.com/29802691/101306282-7a753300-3812-11eb-848b-3ea8e22db341.PNG)



**Web/App Implementation (Optional) or Description of Future Work**\

**MySQL dump**\


**PPT Video (link)**

