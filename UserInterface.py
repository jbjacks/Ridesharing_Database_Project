import mysql.connector
from mysql.connector import errorcode
import datetime
#from prettytable import PrettyTable

def getConnection():
    try:
        cnx = mysql.connector.connect(user = 'jojacks1', password = 'lizzie113', host = 'localhost', database = 'cuber')

    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Something is wrong with the username or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database doen't exist")
        else:
            print(err)

    return cnx

def printOption():
    print("Options:")
    print("1. Add Cars")
    print("2. View Profile")
    print("3. View Trips")
    print("4. View Paymemts")
    print("5. Exit")
    print()

def addCar(id):
    print("Please enter the following information")
    #d_id = str(ID)
    car_id = str(input("car id: "))
    tag_num = str(input("tag number: "))
    tag_state = str(input("tag state: "))
    car_make = str(input("car make: "))
    car_model = str(input("car model: "))
    seats = str(input("number of seats: "))
    luggage_cap = str(input("luggage capacity: "))
    availability = str(input("availability: "))
    address = str(input("current address: "))
    try:
        connection = getConnection()
        connection.autocommit = True

    except AttributeError as err:
        raise err

    try:
        cursor = connection.cursor()

        sql = 'INSERT INTO vehicle(car_id, tag_num, tag_state, make, model, seats, luggage_cap, availability, address)\
        VALUES (\'' + car_id + '\', \'' + tag_num + '\', \'' + tag_state + '\', \'' + car_make + '\', \'' + car_model + '\', \'' + seats + '\', \'' + luggage_cap + '\', \'' + availability + '\', \'' + address + '\');'
        cursor.execute(sql)

        sql = 'INSERT INTO owns(d_id, car_id)\
        VALUES (\'' + id + '\', \'' + car_id + '\');'

        cursor.execute(sql)

        print("Car has been added") 

    except mysql.connector.Error as err:
        print(err)
        connection.close()
        return False

    finally:
        connection.close()   

def viewProfile(id):
        try:
            connection = self.getConnection()

            connection.autocommit = True

        except AttributeError as err:

            raise err 

        try:
            cursor = connection.cursor()

            sql = "SELECT * FROM person JOIN driver ON (person.id = driver.id) WHERE id = '%s';"

            cursor.execute(sql, id)

            result = cursor.fetchall()

            resultTable = PrettyTable(['First Name', 'Last Name', 'Credit Card Number', 'Credit Card Expiration Date', 'Address'])

            for row in result:
                resultTable.add_row(row)

            print(resultTable)

        except mysql.connector.Error as err:

            print (err)

            connection.close()

        except Exception as err:

            print(err)
            connection.rollback()
            connection.close()

        finally:
            connection.close()

def viewTrips(id):
        try:
            connection = self.getConnection()

            connection.autocommit = True

        except AttributeError as err:

            raise err 

        try:
            cursor = connection.cursor()

            sql = "SELECT * FROM driver JOIN fufills ON (driver.id = .id) WHERE id = '%s';"

            cursor.execute(sql, id)

            result = cursor.fetchall()

            resultTable = PrettyTable(['First Name', 'Last Name', 'Credit Card Number', 'Credit Card Expiration Date', 'Address'])

            for row in result:
                resultTable.add_row(row)

            print(resultTable)

        except mysql.connector.Error as err:

            print (err)

            connection.close()

        except Exception as err:

            print(err)
            connection.rollback()
            connection.close()

        finally:
            connection.close()


def main():
    d_id = str(input("Hello, enter your driver id: "))
    printOption()
    selection = int(input("What would you like to do? "))
    while selection != 5:
        if selection == 1:
            addCar(d_id)
        if selection == 2:
            viewProfile(d_id)
        if selection == 3:
            print("not functioning yet")
            viewTrips()
        if selection == 4:
            viewPayments()
        if selection != 5:
            printOption()
            selection = int(input("What would you like to do? "))
main()
