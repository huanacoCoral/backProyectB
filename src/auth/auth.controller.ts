import { BadRequestException, Body, Controller, Get, Inject, Post, UseGuards } from '@nestjs/common';
import { AuthService } from './auth.service';
//import { PrismaService } from 'src/prisma/prisma.service';
//import { AuthGuard } from './guards/auth.guard';

interface UserDTOEnviando {  // esto acepta que llegen datos desde post o algo asi 
    email: string;
    password: string;
}

@Controller('auth')

export class AuthController {
    constructor(private readonly authService: AuthService) {}
    @Get("entramos")
    entramos(){
        return "this.authService.verficar();"
    }
    @Get('listar')
    getUsers() {
            return this.authService.listarVoluntarios();
    }
    /// vborrar lo de arriba 
    @Post('sign-up') //para crear 
    signUp(@Body() user: UserDTOEnviando) {
        
        console.log('user+++', { user });
        
        return this.authService.signUp(user.email, user.password);
        //
    }
    
    @Post('log-in')
    logIn(@Body() user: UserDTOEnviando) {
        console.log('user login +++', { user });
        return this.authService.logIn(user.email, user.password);
    }
  // @UseGuards(AuthGuard)//se supone que esto bloquea pero no funciona --funcion pero verificar 
    

    /*@Get('sign-up')
    signUp(){
        return 'Me encuentras con --->http://localhost:3000/auth/sign-up ';
    }*/
    
    

    

}
