#https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity

function sri
    set url $argv[1]
    set hash (curl -sf $url | openssl dgst -sha384 -binary | openssl base64 -A)
    echo sha384-$hash
end
