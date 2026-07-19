# Changelog

## [v0.1.0] - 2026-07-19

### ✨ v0.1.0 首发版

完整仿照 [`travel-social-content`](https://github.com/bethel-mark/travel-social-content) 架构：

**文件清单（18 个）**：

```
food-social-content/
├── LICENSE                                MIT
├── README.md                              项目门面
├── CONTRIBUTING.md                        PR 流程
├── SKILL.md                               Claude/Codex Skill 主入口
├── pyproject.toml                         Python 包元数据
├── Dockerfile + docker-compose.yml        容器化
├── requirements-api.txt                   FastAPI + 3 LLM 依赖
├── .env.example                           6 LLM + 5 image 模板
├── .gitignore
├── references/
│   ├── cuisines.md            菜系速查（替代 destinations.md）
│   ├── dining-types.md         4 维度选店（独有）
│   ├── food-photo-prompts.md  食物摄影 8 套 prompt（独有）
│   ├── platforms.md           复用 travel 版本
│   ├── copywriting-formulas.md 复用
│   ├── image-models-optimization.md 复用
│   └── output-template.md      复用
├── examples/                4 个城市样例（共 855 行）
│   ├── chengdu-output.md      316 行
│   ├── guangzhou-output.md    191 行
│   ├── xian-output.md         178 行
│   └── changsha-output.md     170 行
├── scripts/
│   ├── install.sh            一键安装
│   ├── search-destination.sh 复用 (软链)
│   ├── make-output.sh        复用 (软链)
│   └── api/                  复用 (软链)
├── assets/
│   └── README.md             占位
└── docs/
    ├── CHANGELOG.md          本文件
    └── GITHUB_UPLOAD_GUIDE.md  复用
```

**核心差异化（vs travel）**：
- 🍲 5 个探店点 × 4 维度选店（老字号/网红/苍蝇馆/私房）
- 🖼 食物摄影 8 套 prompt（蒸汽/油光/暖光专属）
- ⚠️ 选店避坑模块（含生腌/野生菌安全警告）
- 🌶 菜系速查扩展到 6 大菜系

**合规**：所有 AI 生成内容均带《人工智能生成合成内容标识办法》标识
