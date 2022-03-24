echo "Программа поиска пакетов"
echo "Программа предназначена для проверки наличия введенного покета и его установки, если пакет не найден"
echo "Разработчик: Беляев Герман 738-1"
echo "---------------------------------"
echo "Приятного пользования!!!"
echo "---------------------------------"
proverka=0
while [ $proverka -eq 0 ]
do
 read -p "Введите название пакета: " package
 if yum list installed $package
 then
   yum info $package
 else
   echo "Пакет не установлен"
   if yum list $package
   then
     while [ $proverka -eq 0 ]
     do
       read -p "Введенный вами $package был найден в репозиториях, хотите ли его установить? [д;Н]" otvet1
       if [[ "$otvet1" == "д" ]]; then
         yum install -y $package
         break
       elif [[ "$otvet1" == "Н" ]]; then
         break
       elif [[ -z $otvet1 ]]; then    
         break
       else 
         echo "Введенное вами значение не корректно, введите д или Н" 
       fi   
     done
    else 
      echo "Введенный вами $paket не найден в репозиториях" 
    fi
 fi 
 while [ $proverka -eq 0 ]
 do
   read -p "Вы хотите продолжить? [д;Н]" otvet2
       if [[ "$otvet2" == "д" ]]; then
         break
       elif [[ "$otvet2" == "Н" ]]; then  
         exit
       elif [[ -z $otvet2 ]]; then
         exit
       else 
         echo "Введенное вами значение не корректно, введите д или Н" 
       fi
  done        
done
