-- 学校表
CREATE TABLE IF NOT EXISTS schools (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 礼物表
CREATE TABLE IF NOT EXISTS gifts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50),           -- 例：寝具類、運動用品など
    grade VARCHAR(10),              -- 通常 / 高級
    bond_point_small INTEGER,       -- 学生反応：小
    bond_point_medium INTEGER,      -- 学生反応：中
    bond_point_large INTEGER,       -- 学生反応：大
    bond_point_extra INTEGER        -- 学生反応：特大
);

-- 学生基本信息表
CREATE TABLE IF NOT EXISTS student_info (
    id SERIAL PRIMARY KEY,

    -- 多语言名
    name_jp VARCHAR(100) NOT NULL,
    name_en VARCHAR(100),
    name_zh_CN VARCHAR(100),
    name_zh_TW VARCHAR(100),

    -- 外键字段
    school_id INTEGER REFERENCES schools(id),
    gift_id INTEGER REFERENCES gifts(id),

    -- 角色属性
    role_type VARCHAR(50),
    position VARCHAR(50),
    rarity INTEGER CHECK (rarity BETWEEN 1 AND 3),
    release_date DATE
);

-- 经验书类型表
CREATE TABLE IF NOT EXISTS exp_reports (
    name VARCHAR(50) PRIMARY KEY,
    exp_value INTEGER NOT NULL
);

-- 每等级所需素材
CREATE TABLE IF NOT EXISTS level_requirements (
    level INTEGER PRIMARY KEY,
    exp_books INTEGER NOT NULL,
    credits INTEGER NOT NULL
);

-- 技能信息（EX/ノーマル/パッシブ/サブ）
CREATE TABLE IF NOT EXISTS student_skills (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES student_info(id),
    skill_type VARCHAR(20),  -- EX / ノーマル / パッシブ / サブ
    level INTEGER,
    is_max BOOLEAN DEFAULT FALSE
);


-- 装备表
CREATE TABLE IF NOT EXISTS student_equipment (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES student_info(id),
    slot INTEGER CHECK (slot BETWEEN 1 AND 3),
    name VARCHAR(100),
    tier INTEGER CHECK (tier BETWEEN 1 AND 10),
    is_enhanced BOOLEAN DEFAULT FALSE
);


