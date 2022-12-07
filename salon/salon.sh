#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n ~~~~~ Bienvenido a nuestro salon ~~~~~ \n"
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi
  echo -e "¿Qué turno quisiera ocupar?\n"
  SERVICES=$($PSQL "SELECT * FROM services;")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do
  echo "$SERVICE_ID) $SERVICE"
  done

  read SERVICE_ID_SELECTED

  # SERVICE EXISTS
  SERVICE_AVAILABLE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")
  AGENDAR_CITA
  
}


AGENDAR_CITA(){
  if [[ -z $SERVICE_AVAILABLE ]]
  then
    MAIN_MENU "Servicio no disponible, por favor elije otro..."
  
  else
    echo -e "\nEl servicio elegido es $SERVICE_AVAILABLE,\nIndique su numero de telefono:\n"
    read CUSTOMER_PHONE
    # Busca si el cliente existe
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    # El cliente no existe, crea uno nuevo
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nNo tenemos agendado su telefono. Por favor indiqueme su nombre...\n"
      read CUSTOMER_NAME
      CREATE_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
      if [[ $CREATE_CUSTOMER_RESULT == "INSERT 0 1" ]]
      then
        echo -e "\n$CUSTOMER_NAME, Ud. se ha registrado correctamente con su numero de telefono: $CUSTOMER_PHONE"
      fi

    fi

    # El cliente existe, procede con la reserva
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
    echo -e "\n¿En que horario le gustaría realizar la reserva?\n"
    read SERVICE_TIME
    APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")
    echo -e "\nI have put you down for a $SERVICE_AVAILABLE at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
}



MAIN_MENU
