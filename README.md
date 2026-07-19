# 🍜 Food Social Content

> 一份「城市/菜系」→ 「可发的探店/必吃社媒内容方案」Skill。
> 给一个城市或菜系，输出一份可直接发的小红书 / IG / 朋友圈 / 微博 / 抖音内容方案。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Based on](https://img.shields.io/badge/Based%20on-travel--social--content-blue)](https://github.com/YOUR_USERNAME/food-social-content)
[![No External API](https://img.shields.io/badge/API-None%20Required-brightgreen)](#-零依赖)
[![Version: v1.0](https://img.shields.io/badge/Version-v1.0.0-orange)](docs/CHANGELOG.md)

---

## ✨ 这是什么

美食版的「探店/必吃社媒内容生成 Skill」，架构完全对齐 **`travel-social-content`**，但主题从「旅游打卡」改为「美食探店」：

- 🎯 **零外部 API** — 全部走宿主平台（Codex / Claude Code）内建能力
- 🍲 **4 类选店策略** — 老字号 / 网红 / 苍蝇馆 / 私房菜
- 🌶️ **6 大中国菜系速查** — 川 / 粤 / 湘 / 鲁 / 淮扬 / 闽
- 📱 **5 平台适配** — 小红书 / IG / 朋友圈 / 微博 / 抖音
- 🖼️ **AI 生图 Prompt** — 每个探店店 4 套英文 prompt

---

## 🚀 快速上手

### 在 Codex / Claude Code 中使用

```text
请用 food-social-content skill 为「成都」出探店方案，要覆盖 4 类选店策略，预算人均 200。
```

### 直接复制 prompt 用任意 AI

打开 [`SKILL.md`](SKILL.md) → 复制「标准执行流程」→ 粘贴到任意 AI 助手作为 system prompt。

---

## 📚 文档导航

| 文档 | 何时读 |
|---|---|
| [SKILL.md](SKILL.md) | 上手前必读 |
| [references/cuisines.md](references/cuisines.md) | 看哪些菜系已有速查档案 |
| [references/dining-types.md](references/dining-types.md) | **选店策略 4 维度（独有）** |
| [references/food-photo-prompts.md](references/food-photo-prompts.md) | 食物摄影 prompt 公式 |
| [examples/chengdu-output.md](examples/chengdu-output.md) | 完整样例 |

---

## 🧪 4 个真实样例

| 城市 | 特色菜系 | 样例 |
|---|---|---|
| 成都 | 火锅+川菜+苍蝇馆 | [`examples/chengdu-output.md`](examples/chengdu-output.md) |
| 广州 | 早茶+粤菜+煲仔饭 | [`examples/guangzhou-output.md`](examples/guangzhou-output.md) |
| 西安 | 肉夹馍+面食 | [`examples/xian-output.md`](examples/xian-output.md) |
| 长沙 | 臭豆腐+湘菜+茶颜 | [`examples/changsha-output.md`](examples/changsha-output.md) |

---

## 🆚 与 travel-social-content 的差异

| 维度 | travel | food |
|---|---|---|
| 主题 | 城市 / 景点 | 城市 / 菜系 |
| 子景点 | 5-6 个打卡地 | **5 个探店点**（4 维度选店） |
| 季节主线 | 自然 / 文化 | **季节限定食材**（春笋/夏龙虾/秋蟹/冬羊） |
| 必备模块 | 实用信息速查表 | **实用信息**+**选店避坑** |
| AI prompt 重点 | 风景 / 人物 | **食物俯拍 + 蒸汽 + 35mm 微距** |
| 独家 references | （基础）| `dining-types.md` + `food-photo-prompts.md` |

> **相同**：架构、平台规范、文案公式、API / Docker / CI 全复用。

---

## 🛡 零依赖说明

完全复用 travel skill 模式：
- ✅ Web 搜索 → Codex / Claude 内建
- ✅ Web 抓取 → 内建 fetch
- ✅ 文本生成 → LLM 原生
- ✅ 图片生成 → 宿主 image generation

可选扩展（脚本化路径）：`scripts/api/` 已含 image_adapter.py + llm_adapter.py。

---

## 🤝 Contributing

PR 流程：见 [`CONTRIBUTING.md`](CONTRIBUTING.md)（同 travel skill 标准）。

---

## 📜 License

MIT License © 2026 — 自由使用、商用、二次分发。

详细条款见 [LICENSE](LICENSE)。

---

## 🆚 与 travel skill 共生

本 skill 刻意与 `travel-social-content` 保持架构对齐：
- 同样的 7 步流程
- 同样的 8 章节输出
- 同样的 references / examples / scripts 结构
- 同样的 Docker + CI

如想交叉使用（如旅游 + 美食组合 = "成都 3 天 2 夜游 + 火锅 5 家必吃"），两个 skill 可独立调用后手动合并。

> **遵守《人工智能生成合成内容标识办法》及平台规则**
