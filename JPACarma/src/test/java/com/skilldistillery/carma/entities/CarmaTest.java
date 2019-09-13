package com.skilldistillery.carma.entities;

import static org.junit.jupiter.api.Assertions.assertNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CarmaTest {
	static EntityManagerFactory emf;
	static EntityManager em;
	static Carma carma;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("Carma");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		carma = em.find(Carma.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		carma = null;
	}

	@Test
	void test1() {
		assertNull(em.find(Carma.class, 1));
	}

}
