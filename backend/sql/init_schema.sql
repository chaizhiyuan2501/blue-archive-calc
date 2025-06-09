CREATE TABLE IF NOT EXISTS names (id SERIAL PRIMARY KEY);

CREATE TABLE IF NOT EXISTS name_translations (
    id SERIAL PRIMARY KEY,
    name_id INTEGER NOT NULL REFERENCES names (id) ON DELETE CASCADE,
    language_code VARCHAR(10) NOT NULL, -- 语言代码，如 'zh_CN', 'en', 'ja'
    translated_name VARCHAR(100) NOT NULL, -- 翻译后的名称
    UNIQUE (name_id, language_code) -- 确保每个名称在每种语言中只有一个翻译
);

-- 学校表
CREATE TABLE IF NOT EXISTS schools (
    id SERIAL PRIMARY KEY,
    name_id INTEGER NOT NULL REFERENCES names (id),
    UNIQUE (name_id)
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
    name_id INTEGER NOT NULL REFERENCES names (id),
    icon TEXT, -- アイコン画像（ファイルパスまたはURL）
    gift_type VARCHAR(50), -- ギフトタイプ（スイーツ・ぬいぐるみなど）
    description TEXT, -- 説明文
    -- FOREIGN KEY (pond_point_id) REFERENCES pond_point (id), -- 好感度上昇量
);

-- gift_favorites（贈り物と特効キャラクターの関連テーブル）
CREATE TABLE IF NOT EXISTS gift_favorites (
    id SERIAL PRIMARY KEY,
    gift_id INTEGER NOT NULL REFERENCES gifts (id) ON DELETE CASCADE,
    student_id INTEGER NOT NULL REFERENCES student_info (id) ON DELETE CASCADE
);

CREATE TABLE students (
    id SERIAL PRIMARY KEY -- 生徒ID
    name_id INTEGER REFERENCES names (id), -- 名前ID（namesテーブル参照）
    icon TEXT, -- 画像URL
    school_id INT, -- 学校ID（schoolsテーブル参照）
    grade TINYINT, -- 学年
    position VARCHAR(50), -- 配置（前衛・中衛・後衛など）
    attack_type VARCHAR(50), -- 攻撃タイプ（爆発・貫通・神秘など）
    defense_type VARCHAR(50), -- 防御タイプ（重装甲・軽装甲・特殊装甲など）
    role VARCHAR(50), -- ロール（STRIKER・SPECIALなど）
    weapon_type VARCHAR(50), -- 武器タイプ（SMG・AR・SRなど）
    is_limited BOOLEAN DEFAULT FALSE, -- 限定キャラかどうか
    release_date DATE, -- 実装日
    -- FOREIGN KEY (school_id) REFERENCES schools (id) -- 学校ID外部キー
);

-- -- 经验书类型表
-- CREATE TABLE IF NOT EXISTS exp_reports (
--     name VARCHAR(50) PRIMARY KEY,
--     exp_value INTEGER NOT NULL
-- );
-- -- 每等级所需素材
-- CREATE TABLE IF NOT EXISTS level_requirements (
--     level INTEGER PRIMARY KEY,
--     exp_books INTEGER NOT NULL,
--     credits INTEGER NOT NULL
-- );
-- -- 生徒用経験値テーブル
-- CREATE TABLE student_exp_requirements (
--     level INTEGER PRIMARY KEY,
--     total_exp INTEGER NOT NULL, -- そのレベルになるために必要な累計経験値
--     exp_to_next INTEGER -- 次のレベルに進むために必要な経験値（Lv.80はNULL）
-- );
-- -- 技能信息（EX/ノーマル/パッシブ/サブ）
-- CREATE TABLE IF NOT EXISTS student_skills (
--     id SERIAL PRIMARY KEY,
--     student_id INTEGER REFERENCES student_info (id),
--     skill_type VARCHAR(20), -- EX / ノーマル / パッシブ / サブ
--     level INTEGER,
--     is_max BOOLEAN DEFAULT FALSE
-- );
-- -- 装备表
-- CREATE TABLE IF NOT EXISTS student_equipment (
--     id SERIAL PRIMARY KEY,
--     student_id INTEGER REFERENCES student_info (id),
--     slot INTEGER CHECK (slot BETWEEN 1 AND 3),
--     name VARCHAR(100),
--     tier INTEGER CHECK (tier BETWEEN 1 AND 10),
--     is_enhanced BOOLEAN DEFAULT FALSE
-- );