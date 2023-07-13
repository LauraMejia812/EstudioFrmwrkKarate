package users.get;

import com.intuit.karate.junit5.Karate;

public class UserGetRunner {

    @Karate.Test
    Karate userGet(){
        // para no crear varios runners dentro del mismo package se deja .run() vacio para que tome todos los relacionados a la
        //carpeta, en caso de querer alguno en especifico se adiciona el nombre en el .run('')
        return Karate.run().relativeTo(getClass());
    }
}
