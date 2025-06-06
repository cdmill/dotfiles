const NU_LIB_DIRS = [
    "~/.config/nushell/opts"
]

source ~/.config/nushell/themes/gyokuro.nu
def get-git-info [] {
    let git_status = (do -i { git status --porcelain } | complete)
    if ($git_status.exit_code == 0) {
        let branch = (
            do -i { git branch --show-current }
            | complete
            | get stdout
            | str trim
        )
        let branch = $"(ansi i)(ansi b)(ansi $theme.type)($branch)(ansi reset)"

        if ($branch | is-empty) {
            ""
        } else {
            let dirty = (
                if ($git_status.stdout | lines | length) > 0 {
                    $"(ansi $theme.alt)*(ansi reset)"
                }
                else { "" }
            )
            let ab_info = ""
            # let first_line = ($git_status.stdout | lines | first)
            # let ab_info = (
            #     if ($first_line | str contains "ahead") {
            #         let ahead = (
            #             $first_line
            #             | parse --regex 'ahead (\d+)'
            #             | get capture0.0?
            #             | default 0
            #         )
            #         $"↑($ahead)"
            #     } else if ($first_line | str contains "behind") {
            #         let behind = (
            #             $first_line
            #             | parse --regex 'behind (\d+)'
            #             | get capture0.0?
            #             | default 0
            #         )
            #         $"↓($behind)"
            #     } else {
            #         ""
            #     }
            # )
            let ab_info = $"(ansi $theme.property)($ab_info)(ansi reset)"
            $" ($dirty)($branch)($ab_info)"
        }
    } else { "" }
}

def create_left_prompt [] {
    let dir = match (
        do --ignore-shell-errors { $env.PWD | path relative-to $nu.home-path }
    ) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    let git_info = (get-git-info)
    let path_color = (
        if (is-admin) { ansi red }
        else { ansi light_green })
    let separator_color = (
        if (is-admin) { ansi light_red }
        else { ansi light_green })
    let path_segment = $"($path_color)($dir)(ansi reset)"

    $path_segment | str replace --all (char path_sep) $"($separator_color)(char path_sep)($path_color)"
    $"($path_segment)($git_info)"
}

def create_right_prompt [] {
    let time_segment = ([
        (ansi reset)
        (ansi magenta)
        (date now | format date '%H:%M') # try to respect user's locale
    ] | str join | str replace --regex --all "([/:])" $"(ansi green)${1}(ansi magenta)" |
        str replace --regex --all "([AP]M)" $"(ansi magenta_underline)${1}")

    let last_exit_code = if ($env.LAST_EXIT_CODE != 0) {([
        (ansi rb)
        ($env.LAST_EXIT_CODE)
    ] | str join)
    } else { "" }

    ([$last_exit_code, (char space), $time_segment, (char space)] | str join)
}

$env.PROMPT_COMMAND = {|| create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {|| create_right_prompt }
$env.PROMPT_INDICATOR = {|| "> " }
$env.PROMPT_INDICATOR_VI_INSERT = {|| $"(ansi $theme.operator)>(ansi reset) " }
$env.PROMPT_INDICATOR_VI_NORMAL = {|| $"(ansi $theme.operator):(ansi reset) " }
$env.PROMPT_MULTILINE_INDICATOR = {|| $"(ansi $theme.operator):::(ansi reset) " }
$env.TRANSIENT_PROMPT_COMMAND = ""

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "Path": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
    ($nu.data-dir | path join 'completions') # default home for nushell completions
]

$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]

$env.path ++= [
    "~/.local/bin",
    "~/.cargo/bin"
]

$env.RUST_BACKTRACE = 1
$env.VIRTUAL_ENV_DISABLE_PROMPT = 1
$env.MANPAGER = "nvim +Man!"
$env.GPG_TTY = (tty)
$env.LESS = ($env.LESS? | default "" | str replace --regex 'X' '')
$env.FZF_DEFAULT_OPTS = '
--color=fg:#767777,bg:#161617,hl:#bbc7b1,gutter:#161617
--color=fg+:#748fa6,bg+:#222324,hl+:#bbc7b1
--color=info:#767777,prompt:#bbc7b1,pointer:#748fa6
--color=marker:#72966c,spinner:#72966c,header:#72966c
--separator="─" --scrollbar="│" --layout="reverse" --info="right"
--prompt=" "
--marker=">"
--pointer="󰘍"
--cycle
--multi
--height 40%
--preview "cat {} 2> /dev/null"
--preview-window="right:60%:hidden"
--bind="?:toggle-preview"
--bind="ctrl-u:preview-page-up"
--bind="ctrl-d:preview-page-down"'

zoxide init nushell | save -f ~/.zoxide.nu
