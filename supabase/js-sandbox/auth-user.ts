import { client } from './providers/supabase-client.ts'
import { log } from 'node:console'

const register = async ()  => {
    const response = await client.auth.signUp({ 
        email: 'user@example.com', 
        password: 'example', 
        options: {
            data: {
                first_name: 'first_name', 
                last_name: 'last_name', 
                email: 'user@example.com', 
                phone: '+55 (11) 99176-5379',
                birthdate: '10/05/2001', 
                gender: 'male', 
                img_url: 'anything'
            }
        }
    })
    log('registered -> ', response)
}

const authenticate_with_password = async () => { 
    const response = await client.auth.signInWithPassword({ 
        email: 'user@example.com', 
        password: 'example',
    })
    log('authenticated -> ', response)
}
