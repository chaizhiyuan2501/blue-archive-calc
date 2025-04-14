CREATE TABLE IF NOT EXISTS student_info (
    id SERIAL PRIMARY KEY,
    -- 多语言名
    name_jp VARCHAR(100) NOT NULL,
    name_en VARCHAR(100),
    name_zh_CN VARCHAR(100),
    name_zh_TW VARCHAR(100),
    -- 外键字段（引用 schools/gifts）
    school_id INTEGER REFERENCES schools (id),
    gift_id INTEGER REFERENCES gifts (id),
    -- 角色属性
    role_type VARCHAR(50),
    position VARCHAR(50),
    rarity INTEGER CHECK (rarity BETWEEN 1 AND 3),
    release_date DATE
);

CREATE TABLE IF NOT EXISTS schools (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS gifts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50), -- 例：寝具類、運動用品など
    grade VARCHAR(10), -- 通常 / 高級
    bond_point_small INTEGER, -- 学生反応：小
    bond_point_medium INTEGER, -- 学生反応：中
    bond_point_large INTEGER, -- 学生反応：大
    bond_point_extra INTEGER -- 学生反応：特大
);