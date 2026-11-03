ALTER TABLE usuarios ADD COLUMN IF NOT EXISTS perfil ENUM('admin','cliente') NOT NULL DEFAULT 'cliente';

INSERT INTO usuarios (nome, email, cpf, senha, perfil)
SELECT 'Administrador', 'admin@admin.com', '52998224725', '$2y$10$j.ShcbmDQFcwqECd053ov.I5ceRfOpb5aCvscuNrpzOT.TtB9.NTm', 'admin'
WHERE NOT EXISTS (SELECT 1 FROM usuarios WHERE email = 'admin@admin.com');

UPDATE usuarios SET perfil = 'cliente' WHERE email <> 'admin@admin.com';
