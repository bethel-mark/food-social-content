---
name: food-social-content
description: >
  **支持 WebSearch 实时数据**（无联网时自动回退到 LLM 知识 + 速查档案）
  生成美食目的地社交媒体内容方案。当用户希望为某个城市或菜系产出可直接发布的小红书、Instagram、朋友圈、微博、抖音的美食探店 / 必吃清单 / 选店维度图文或视频脚本时调用本 skill。输入城市或菜系（可附平台与风格偏好），自动搜索爆款探店文案、提炼热门标签、生成 5 种风格的中英文对照文案与 AI 生图 Prompt、给出选店维度（老字号/网红/苍蝇馆/私房菜）的对比、给出发布时间与互动话术建议，并输出可复制粘贴的最终方案 Markdown。 触发词：美食社媒、探店文案、餐厅文案、小红书美食、美食内容。 Use when 用户要求为餐厅/探店生成社媒图文（小红书/IG/微博）。
---

# 🍜 Food Social Content · 美食社媒内容生成

> 一句话定位：**给一个城市或菜系，输出一份可发的「探店 / 必吃 / 选店」美食社媒内容方案**。

完全套用 [`travel-social-content`](https://github.com/bethel-mark/travel-social-content) 的 Skill 架构（同一作者 / 同套标准），但主题从「旅游打卡」改为「美食探店」。

---

## ✅ 何时调用 / ❌ 何时不要调用

✅ 调用场景：
- 用户：「帮我出一份成都探店方案」「广州早茶怎么选」「长沙必吃清单」
- 用户甩一张菜品 / 餐厅图，希望产出一篇探店图文
- 用户要做系列化内容（如「中国早餐巡礼」「各省早餐 PK」）

❌ 不要调用：
- 纯商业广告 / 品牌方付费投放
- 单纯问「这餐厅好不好吃」
- 与美食无关的话题

---

## 📥 输入约定

| 字段 | 必填 | 默认值 | 说明 |
|---|---|---|---|
| `城市 / 菜系` | ✅ | — | 例：「成都」/「湘菜」/「广州早茶」 |
| `平台` | ❌ | `小红书` | `小红书 / Instagram / 朋友圈 / 微博 / 抖音` |
| `风格` | ❌ | `反差吸引型` | 5 种风格见下 |
| `预算` | ❌ | — | 人均多少元 |
| `场景` | ❌ | — | 约会 / 商务 / 独食 / 多人 / 宵夜 |
| `必吃偏好` | ❌ | — | 辣 / 不辣 / 海鲜 / 素食 / 甜品 |

---

## 🧭 标准执行流程（7 步，与 travel skill 完全对齐）

### Step 1 · 解析输入
提取 城市/菜系 / 平台 / 风格 / 预算 / 场景 / 偏好

### Step 2 · 搜索信息（**联网 + 自动回退**）

Skill 支持两种运行模式，**优先尝试联网，失败自动回退**：

#### 🌐 模式 A：联网模式（WebSearch / WebFetch）

当 Agent 支持 `WebSearch` / `WebFetch` 工具时调用：

| 信息类型 | 推荐工具 | 搜索词模板 |
|---|---|---|
| 景点/餐厅基础信息 | WebSearch | `{目的地} 简介 {当前年}` |
| 门票 / 开放时间 / 价格 | WebSearch | `{地点} 门票 开放时间 {当前年}` |
| 爆款规律 | WebSearch | `{目的地} 小红书 爆款 {当前年}` |
| 实时热门 | WebSearch | `{目的地} 热门话题 {当前月}` |
| 实测信息 | WebFetch | 携程/小红书/抖音 URL |

#### 📴 模式 B：离线模式（LLM 内建知识 + 速查档案）

当 Agent **无 WebSearch 工具** 或 **联网失败**时自动回退：

1. **首选**：本 skill 的速查档案（destinations.md）
2. **兜底**：宿主 LLM 的预训练知识
3. **补充**：用户提供的参考资料

#### ⚙️ 回退触发条件

```
❌ 触发回退的条件（任一即触发）：
  • Agent 工具列表中无 WebSearch / WebFetch
  • WebSearch 调用返回 timeout / 403 / network error
  • WebSearch 返回空结果
  • 用户主动指定 web=false
```

#### 🎛️ 用户控制参数

| 参数 | 默认 | 行为 |
|---|---|---|
| `web=auto` | ✅ | 先尝试联网，失败自动回退到离线 |
| `web=true` |   | 仅联网模式（失败时报错） |
| `web=false` |   | 仅离线模式（跳过联网） |

> 💡 **开源原则**：本 Skill 不内置任何 API Key，所有联网通过宿主 Agent 的 WebSearch 工具完成。零依赖 = 任何 Agent 即装即用，联网能力取决于 Agent 配置。

详细策略：[`references/web-search-strategy.md`](references/web-search-strategy.md)
### Step 3 · 拆解 5 个代表性探店点
- 老字号 1 家（百年传承）
- 网红 1 家（KOL 推荐）
- 苍蝇馆 1 家（本地人私藏）
- 私房菜 1 家（提前预约）
- 时令限定 1 家（季节性）

### Step 4 · 生成 5 种文案风格
- **A 系列打卡型**：Day1-Day3 必吃路线
- **B 情绪共鸣型**：食物带来的治愈瞬间
- **C 反差吸引型**：「以为 X / 结果 Y」
- **D 数字攻略型**：人均 ¥X 吃 X 道菜
- **E 60s 沉浸脚本**：餐前香气 + 制作慢镜 + 入口炸点

### Step 5 · AI 生图 Prompt 套件
每个探店店输出：
- **菜牌拍**（俯拍 + 暖光 + 食物特写）
- **店招拍**（门牌 + 人流）
- **人物拍**（吃相 / 餐具）
- **食材拍**（原料 / 制作过程）

### Step 6 · 平台适配
套用 platforms.md 规则

### Step 7 · 输出方案
8 章节标准化输出（与 travel skill 完全一致）

---

## 📐 输出结构（8 章节 + 5 探店点 × 6 字段）

```
📌 目的地（菜系）简述
🏞️ 5 个探店点详细方案
   └── 每个点：📝文案 + 🎨风格 + 🖼️AI prompt × 4 + 📱5 风格模板 + 📋实用信息 + ✨视觉元素
📢 发布建议
📈 热门趋势分析
🔄 系列化建议
🛡 选店避坑
🔗 参考来源
```

详见 `references/output-template.md`

---

## 🛡 选店维度（独家引入）

美食 Skill 比旅游 Skill 多一组维度——**4 类选店策略**：

| 维度 | 适合 | 风险 |
|---|---|---|
| **老字号** | 文化深度 / 游客来体验 | 价格贵 / 排队久 |
| **网红店** | 出片 / 24-30 岁 | 价高 / 可能踩雷 |
| **苍蝇馆** | 本地人真正日常 | 环境糟 / 难找 |
| **私房菜** | 商务 / 特殊场景 | 难预约 |

详见 `references/dining-types.md`

---

## 🖼️ AI 生图 Prompt 特殊配方（vs 旅游 Skill）

美食的「视觉钩子」是**食物本体 + 色彩 + 蒸汽**。每张图都强调：

```
[菜品俯拍 + 暖光 + 35mm 微距 + 蒸汽 + 俯仰角] + [风格]
```

例如：冒菜俯拍 = 红色油汤 + 9 种食材 + 蒸汽 + 俯拍 + 暖色

---

## 🛡 合规 / 风险

- 真实推荐店家需**自测过**（避免踩雷给商家背书）
- 价格虚标要**注明以实际为准**
- 食品安全敏感菜（如生腌、野生菌）**必须标注风险**
- AI 生成图必须带 `#AI生成` 标识（依《人工智能生成合成内容标识办法》）

---

## 📁 项目结构

与 travel-social-content 完全对齐，便于二次开发：

```
food-social-content/
├── SKILL.md                  ← 你正在读
├── README.md
├── LICENSE
├── references/
│   ├── cuisines.md              ← 菜系速查（替代 destinations.md）
│   ├── platforms.md             ← 复用 travel 的版本
│   ├── copywriting-formulas.md
│   ├── image-models-optimization.md
│   ├── output-template.md
│   ├── dining-types.md          ← 独有：4 维度选店
│   └── food-photo-prompts.md   ← 独有：食物摄影专项
├── examples/
│   ├── chengdu-output.md        ← 成都火锅 + 川菜
│   ├── guangzhou-output.md      ← 广州早茶 + 粤菜
│   ├── xian-output.md           ← 西安面食 + 凉皮
│   └── changsha-output.md       ← 长沙臭豆腐 + 湘菜
├── scripts/
│   ├── install.sh               ← 复用
│   ├── search-recipe.sh
│   └── api/                     ← 复用 travel 的 image_adapter.py
├── assets/
└── docs/
    ├── CHANGELOG.md
    └── GITHUB_UPLOAD_GUIDE.md
```

---

## 🧪 测试用例

| 目的地 | 菜系 | 样例 |
|---|---|---|
| 成都 | 火锅+川菜+苍蝇馆 | [`examples/chengdu-output.md`](examples/chengdu-output.md) |
| 广州 | 早茶+粤菜+煲仔饭 | [`examples/guangzhou-output.md`](examples/guangzhou-output.md) |
| 西安 | 肉夹馍+面食 | [`examples/xian-output.md`](examples/xian-output.md) |
| 长沙 | 臭豆腐+湘菜 | [`examples/changsha-output.md`](examples/changsha-output.md) |

---

> 本 skill 完全复刻 [`travel-social-content`](https://github.com/bethel-mark/travel-social-content) 架构。如发现两份有显著差异，欢迎提 Issue。
