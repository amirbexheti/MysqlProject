SELECT * from notat n 
INNER JOIN studenti s on s.ID = n.ID_Studenti 
INNER JOIN lendet l on l.ID = n.ID_Lendet;

SELECT * FROM profesoret p 
INNER JOIN lendet l on p.ID_Lendet = l.ID

SELECT * FROM profesoret p 
INNER JOIN fakullteti f on f.ID = p.ID_Fakulteti

SELECT * FROM studenti s
INNER JOIN fakullteti f on f.ID = s.ID_Fakulteti