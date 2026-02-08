import { BadGatewayException, BadRequestException, Injectable } from '@nestjs/common';
/*import { JwtService } from '@nestjs/jwt';
import { compare } from 'bcrypt';
import { encrypt } from 'src/lib/bcrypt';*/
import { PrismaService } from 'src/prisma/prisma.service';
//logica necesaria para conectrnos
@Injectable()
export class AuthService {
    constructor(
        private prismaService: PrismaService, 
        /*private jwtService: JwtService*/
    ) { }
    async verficar(){
        console.log("entramos aqqui");
        
        return await "logramos entrar "
    }
    async getListar() {
        console.log("intentandolistar");
        
        return await this.prismaService.usuario.findMany();//muestra
    }
    async obtener(email: string, password: string){
        const x="email"+email+" co nstra "+password
        return await x;
    }
    /// recien de aquiabajo
     async signUp(email: string, password: string) {
        try {
            const userFound = await this.prismaService.usuario.findUnique({ //Ya hay alguien en la lista con este email?”
                where: {
                    email,
                }
            });
            
            if (userFound) throw new BadGatewayException('El usuario ya existe o revisar Auth Service '); //true
            /*const hashedPassword = await encrypt(password);//encripta
            
            const user = await this.prismaService.usuario.create({ //false CREA AL USUARIO
                data: {
                    'id_voluntario': 2,
                    email,
                    password: hashedPassword
                }
            });
            const { password: _, ...userWithoutPassword } = user; //averiguar que hace:mantiene la informacion de la creacion sin el password
            const payload = { ...userWithoutPassword }
            const access_token = await this.jwtService.signAsync(payload);
            return { access_token };*/
        } catch (error) {
            console.error("error al crear")
            if (error instanceof BadGatewayException) { throw error; }
            throw new Error(error)
        }

    }
   
}
