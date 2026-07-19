# Repository Description

> 此文件专为 GitHub 仓库页提供精简的项目说明（区别于 [`SKILL.md`](SKILL.md) 的完整技能规范）。

---

## 🍜 food-social-content · 一句话定位

**为一个城市或菜系，输出一份可发的「小红书/IG/朋友圈/微博/抖音」美食探店方案** —— 含 5 个探店点 × 4 类选店维度（老字号/网红/苍蝇馆/私房）× 5 种文案风格 × 8 套食物摄影 AI prompt。

---

## 🎯 何时使用

- **想吃透一个城市的美食**（成都火锅 / 广州早茶 / 西安碳水 / 长沙湘辣）
- **做探店号 / 美食博主**有结构化选题需求
- **需要真实区分老字号 vs 网红 vs 苍蝇馆**（不踩雷）
- **有推荐菜品的合规顾虑**（食品安全 / 隐私 / 商家背书）

## ❌ 何时不要使用

- 没有自测过的商家（不背书）
- 野生食材 + 高风险菜（生腌 / 河豚 / 野生菌）需自行标注风险
- 内容仅针对纯素食 / 纯清真市场（覆盖不全）

---

## 💡 关键能力

| 能力 | 文档 |
|---|---|
| 6 大菜系速查 | [`references/cuisines.md`](references/cuisines.md) |
| **4 维度选店策略**（独有）| [`references/dining-types.md`](references/dining-types.md) |
| **8 套食物摄影 AI prompt**（独有）| [`references/food-photo-prompts.md`](references/food-photo-prompts.md) |
| 5 种文案风格 | [`references/copywriting-formulas.md`](references/copywriting-formulas.md) |
| 4 大平台规范 | [`references/platforms.md`](references/platforms.md) |
| 4 个城市完整方案 | [`examples/`](examples/) |
| REST API 服务 | [`scripts/api/server.py`](scripts/api/server.py) |

---

## 🚀 快速上手

```text
在 Codex/Claude Code 输入:
用 food-social-content skill 为「成都」出探店方案，4 维度选店，人均预算 200。

或本地 CLI:
bash scripts/install.sh symlink
python scripts/api/server.py
```

---

## 🔗 关联 Skill

- [`../travel-social-content/`](../travel-social-content/) —— 同一作者，旅游主题版
- [`../travel-and-food-skill/`](../travel-and-food-skill/) —— 旅游+美食合并版
- 美食 Skill 的 references/ 6 个与 travel 共享（symlink）

## 📜 版本 / 合规

- License: MIT
- v0.1.0 首发
- 风险提示：食品安全 / 隐私 / 价格虚标 / 商家推荐背书，需遵守平台规则

---

> 🏷 **GitHub Topics**: `claude-code` · `codex` · `skill` · `food` · `social-media` · `xiaohongshu` · `instagram` · `restaurant` · `chinese-cuisine` · `midjourney` · `dall-e`
