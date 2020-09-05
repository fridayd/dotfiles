# A modified 'Sorin' prompt with time stamp and vcs status.
function fish_prompt --description 'Write out the prompt'

    set -l color_cwd
    set -l suffix

    switch "$USER"
        case root toor
            set suffix (set_color red)'❮'(set_color yellow)'❮'(set_color green)'❮'
        case '*'
            set suffix (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯'
    end

    # PWD
    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color normal

    # Suffix
    echo -n " $suffix "
end
