-- 学校表
CREATE TABLE IF NOT EXISTS schools (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- 礼物表
CREATE TABLE IF NOT EXISTS gifts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50), -- 例：寝具類、運動用品など
    grade VARCHAR(10), -- 通常 / 高級
);

-- 絆上昇量
CREATE TABLE if not EXISTS pond_point (
    id SERIAL PRIMARY KEY,
    type VARCHAR(100) NOT NULL,
    bond_point_small INTEGER, -- 学生反応：小
    bond_point_medium INTEGER, -- 学生反応：中
    bond_point_large INTEGER, -- 学生反応：大
    bond_point_extra INTEGER -- 学生反応：特大
);

-- gifts（贈り物基本情報テーブル）
CREATE TABLE IF NOT EXISTS gifts (
    id SERIAL PRIMARY KEY, -- ギフトID
    name VARCHAR(100) NOT NULL, -- ギフト名
    icon VARCHAR(255), -- アイコン画像（ファイルパスまたはURL）
    description TEXT, -- 説明文
    gift_type VARCHAR(50), -- ギフトタイプ（スイーツ・ぬいぐるみなど）
    affection_increase INTEGER NOT NULL, -- 好感度上昇量
    obtain_method TEXT -- 入手方法（例：ショップ、ドロップ）
);

-- gift_favorites（贈り物と特効キャラクターの関連テーブル）
CREATE TABLE IF NOT EXISTS gift_favorites (
    id SERIAL PRIMARY KEY,
    gift_id INTEGER NOT NULL REFERENCES gifts (id) ON DELETE CASCADE,
    student_id INTEGER NOT NULL REFERENCES student_info (id) ON DELETE CASCADE
);

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    school_id INT,
    grade TINYINT,
    position VARCHAR(50),
    attack_type VARCHAR(50),
    defense_type VARCHAR(50),
    role VARCHAR(50),
    weapon_type VARCHAR(50),
    is_limited BOOLEAN DEFAULT FALSE,
    release_date DATE,
    image_url TEXT,
    FOREIGN KEY (school_id) REFERENCES schools (id)
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

-- 生徒用経験値テーブル
CREATE TABLE student_exp_requirements (
    level INTEGER PRIMARY KEY,
    total_exp INTEGER NOT NULL, -- そのレベルになるために必要な累計経験値
    exp_to_next INTEGER -- 次のレベルに進むために必要な経験値（Lv.80はNULL）
);

-- 技能信息（EX/ノーマル/パッシブ/サブ）
CREATE TABLE IF NOT EXISTS student_skills (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES student_info (id),
    skill_type VARCHAR(20), -- EX / ノーマル / パッシブ / サブ
    level INTEGER,
    is_max BOOLEAN DEFAULT FALSE
);

-- 装备表
CREATE TABLE IF NOT EXISTS student_equipment (
    id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES student_info (id),
    slot INTEGER CHECK (slot BETWEEN 1 AND 3),
    name VARCHAR(100),
    tier INTEGER CHECK (tier BETWEEN 1 AND 10),
    is_enhanced BOOLEAN DEFAULT FALSE
);
