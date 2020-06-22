package com.dockerdebug.demo;

import io.restassured.http.ContentType;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import static io.restassured.RestAssured.given;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.not;
import static org.springframework.http.HttpStatus.OK;

@SpringBootTest
class DockerdebugApplicationTests {

	@Test
	public void testGetFindOK() {

		given()
				.request()
				.header("Accept" ,ContentType.ANY)
				.header("Content-type" ,ContentType.JSON)

				.when()
				.get("/pessoa/nomeCompleto")

				.then()
				.log().body().and()
				.statusCode(OK.value())

				//containsInAnyOrder:
				//  deve receber TODOS ITEMS DA LISTA
				.body("name" ,is("Paulo11"))
		;
	}

	@Test
	public void testGetFindOK2() {

		given()
				.request()
				.header("Accept" ,ContentType.ANY)
				.header("Content-type" ,ContentType.JSON)

				.when()
				.get("/pessoa/nomeCompleto2")

				.then()
				.log().body().and()
				.statusCode(OK.value())

				//containsInAnyOrder:
				//  deve receber TODOS ITEMS DA LISTA
				.body("name" ,is("Paulo2"))
		;
	}

	@Test
	public void testGetFindNotOK() {

		given()
				.request()
				.header("Accept" ,ContentType.ANY)
				.header("Content-type" ,ContentType.JSON)

				.when()
				.get("/pessoa/nomeCompleto")

				.then()
				.log().body().and()
				.statusCode(OK.value())

				//containsInAnyOrder:
				//  deve receber TODOS ITEMS DA LISTA
				.body("nome" ,not("Paulo25671419"))
		;
	}

}
