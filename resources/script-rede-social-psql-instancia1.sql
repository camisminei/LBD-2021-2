DROP TABLE IF EXISTS ALUNO CASCADE;
DROP TABLE IF EXISTS AMIGO CASCADE;
DROP TABLE IF EXISTS CURTIDA CASCADE;

CREATE TABLE aluno (
  idt_aluno SERIAL PRIMARY KEY,
  des_nome varchar(255) DEFAULT NULL,
  num_grau int DEFAULT NULL
);

CREATE TABLE amigo (
  idt_aluno1 int DEFAULT NULL,
  idt_aluno2 int DEFAULT NULL,
  FOREIGN KEY (idt_aluno1) REFERENCES aluno (idt_aluno) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idt_aluno2) REFERENCES aluno (idt_aluno) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE curtida (
  idt_aluno1 int DEFAULT NULL,
  idt_aluno2 int DEFAULT NULL,
  FOREIGN KEY (idt_aluno1) REFERENCES aluno (idt_aluno) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (idt_aluno2) REFERENCES aluno (idt_aluno) ON DELETE CASCADE ON UPDATE CASCADE
);

insert into aluno values (1689, 'Gabriel', 9);
insert into aluno values (1510, 'Jordan', 9);
insert into aluno values (1381, 'Tiffany', 9);
insert into aluno values (1709, 'Cassandra', 9);
insert into aluno values (1101, 'Haley', 10);
insert into aluno values (1782, 'Andrew', 10);
insert into aluno values (1468, 'Kris', 10);
insert into aluno values (1641, 'Brittany', 10);
insert into aluno values (1247, 'Alexis', 11);
insert into aluno values (1316, 'Austin', 11);
insert into aluno values (1911, 'Gabriel', 11);
insert into aluno values (1501, 'Jessica', 11);
insert into aluno values (1304, 'Jordan', 12);
insert into aluno values (1025, 'John', 12);
insert into aluno values (1934, 'Kyle', 12);
insert into aluno values (1661, 'Logan', 12);

insert into amigo values (1510, 1381);
insert into amigo values (1510, 1689);
insert into amigo values (1689, 1709);
insert into amigo values (1381, 1247);
insert into amigo values (1709, 1247);
insert into amigo values (1689, 1782);
insert into amigo values (1782, 1468);
insert into amigo values (1782, 1316);
insert into amigo values (1782, 1304);
insert into amigo values (1468, 1101);
insert into amigo values (1468, 1641);
insert into amigo values (1101, 1641);
insert into amigo values (1247, 1911);
insert into amigo values (1247, 1501);
insert into amigo values (1911, 1501);
insert into amigo values (1501, 1934);
insert into amigo values (1316, 1934);
insert into amigo values (1934, 1304);
insert into amigo values (1304, 1661);
insert into amigo values (1661, 1025);
insert into amigo select idt_aluno2, idt_aluno1 from amigo;

insert into curtida values(1689, 1709);
insert into curtida values(1709, 1689);
insert into curtida values(1782, 1709);
insert into curtida values(1911, 1247);
insert into curtida values(1247, 1468);
insert into curtida values(1641, 1468);
insert into curtida values(1316, 1304);
insert into curtida values(1501, 1934);
insert into curtida values(1934, 1501);
insert into curtida values(1025, 1101);