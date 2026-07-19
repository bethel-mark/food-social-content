#!/usr/bin/env bash
# install.sh — 一键安装 food-social-content Skill
# 用法: ./scripts/install.sh symlink | copy | uninstall
# 安装逻辑与 travel-social-content 完全相同，仅 SKILL_NAME 不同

set -uo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SKILL_NAME="$(basename "$SKILL_ROOT")"

CODEX_SKILLS_DIR="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
CLAUDE_SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"

print_a() { printf "\033[1;36m▶\033[0m %s\n" "$*"; }
print_s() { printf "\033[1;32m✓\033[0m %s\n" "$*"; }
print_w() { printf "\033[1;33m⚠\033[0m %s\n" "$*"; }

MODE="${1:-symlink}"
case "$MODE" in
    symlink)
        print_a "symlink 模式（开发模式）"
        mkdir -p "$CODEX_SKILLS_DIR" 2>/dev/null || true
        mkdir -p "$CLAUDE_SKILLS_DIR" 2>/dev/null || true
        for td in "$CODEX_SKILLS_DIR" "$CLAUDE_SKILLS_DIR"; do
            target="$td/$SKILL_NAME"
            rm -rf "$target" 2>/dev/null || true
            if ln -sf "$SKILL_ROOT" "$target" 2>/dev/null; then
                print_s "$target → $SKILL_ROOT"
            else
                print_w "$td 没有写入权限, 跳过"
            fi
        done
        ;;
    copy) print_a "copy 模式"; mkdir -p "$CODEX_SKILLS_DIR" && cp -R "$SKILL_ROOT" "$CODEX_SKILLS_DIR/$SKILL_NAME" && print_s "OK" ;;
    uninstall) print_a "卸载"; for td in "$CODEX_SKILLS_DIR" "$CLAUDE_SKILLS_DIR"; do rm -rf "$td/$SKILL_NAME" 2>/dev/null && print_s "removed $td/$SKILL_NAME"; done ;;
    *) echo "用法: $0 {symlink|copy|uninstall}"; exit 1 ;;
esac

echo ""
entry="$CODEX_SKILLS_DIR/$SKILL_NAME/SKILL.md"
[ -e "$entry" ] && nm=$(awk '/^name:/{print $2; exit}' "$entry") && print_s "Skill '$nm' OK"
print_a "测试"
echo "  在 Codex 输入: 用 $SKILL_NAME skill 为「重庆」出方案"
