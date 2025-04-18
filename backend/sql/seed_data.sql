﻿-- 插入学校
INSERT INTO
    schools (name)
VALUES
    ('百鬼夜行'),
    ('レッドウィンター'),
    ('トリニティ'),
    ('ゲヘナ'),
    ('アビドス'),
    ('ミレニアム'),
    ('アリウス'),
    ('山海経'),
    ('ヴァルキューレ'),
    ('SRT'),
    ('その他');

-- 插入礼物
-- 通常贈り物（例：ぬいぐるみ）
INSERT INTO
    gifts (
        name,
        category,
        grade,
        bond_point_small,
        bond_point_medium,
        bond_point_large,
        bond_point_extra
    )
VALUES
    ('ぬいぐるみ', '人形', '通常', 20, 40, 60, 80);

-- 高級贈り物（例：高級チョコ）
INSERT INTO
    gifts (
        name,
        category,
        grade,
        bond_point_small,
        bond_point_medium,
        bond_point_large,
        bond_point_extra
    )
VALUES
    ('高級チョコレート', 'お菓子', '高級', NULL, 120, 180, 240);

-- 插入角色
INSERT INTO
    student_info (
        name_jp,
        name_en,
        name_zh_CN,
        name_zh_TW,
        school_id,
        gift_id,
        role_type,
        position,
        rarity,
        release_date
    )
VALUES
    (
        'ハナコ（水着）',
        'Hanako (Swimsuit)',
        '泳装花子',
        '泳裝花子',
        1,
        1,
        '攻撃型',
        '後衛',
        3,
        '2021-08-10'
    );

INSERT INTO
    exp_reports (name, exp_value)
VALUES
    ("初級レポート", 50),
    ("中級レポート", 500),
    ("上級レポート", 2000),
    ("最上級レポート", 10000);

INSERT INTO
    level_requirements (level, exp_books, credits)
VALUES
    (91, 10, 10000),
    (92, 12, 12000),
    (93, 14, 14000),
    (94, 16, 16000),
    (95, 18, 18000),
    (96, 20, 20000),
    (97, 22, 22000),
    (98, 24, 24000),
    (99, 26, 26000),
    (100, 28, 28000);
