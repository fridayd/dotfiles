# A modified 'Sorin' prompt with time stamp and vcs status.
function fish_prompt --description 'Write out the prompt'

    set -l suffix

    switch "$USER"
        case root toor
            set suffix (set_color red)'❮'(set_color yellow)'❮'(set_color green)'❮'
        case '*'
            set suffix (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯'
    end

    # PWD
    set_color blue
    echo -n (prompt_pwd)

    # Suffix
    set_color normal
    echo -n " $suffix "
end
