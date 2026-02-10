import { BadGatewayException, BadRequestException, Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { encrypt } from 'src/lib/bcrypt';
import { compare } from 'bcrypt';
/*import { JwtService } from '@nestjs/jwt';

import { encrypt } from 'src/lib/bcrypt';*/
import { PrismaService } from 'src/prisma/prisma.service';
//logica necesaria para conectrnos
@Injectable()
export class AuthService {
    constructor(
        private prismaService: PrismaService, 
        private jwtService: JwtService
    ) { }
    async verficar(){
        console.log("entramos aqqui");
        
        return await "logramos entrar "
    }
    async getListar() {
        console.log("intentandolistar");
        
        return await this.prismaService.usuario.findMany();//muestra
    }
    
    async listarVoluntarios(){
        
        return await this.prismaService.voluntario.findMany();//muestra;
    }
    /// recien de aquiabajo
     async signUp(email: string, password: string) {
        try {
            const userFound = await this.prismaService.usuario.findUnique({ //Ya hay alguien en la lista con este email?”
                where: {
                    email,
                }
            });//sql
            
            if (userFound) throw new BadGatewayException('El usuario ya existe o revisar Auth Service '); //true
            const hashedPassword = await encrypt(password);//encripta
            /*const voluntario = await this.prismaService.voluntario.create({
            data: {}
            });*/
            const user = await this.prismaService.usuario.create({ //false CREA AL USUARIO
                data: {
                    voluntario: {
                        create: {} //creara automaticamente
                        },
                    email,
                    password: hashedPassword
                }
            });
            const { password: _, ...userWithoutPassword } = user; //averiguar que hace:mantiene la informacion de la creacion sin el password
            const payload = { ...userWithoutPassword }
            const access_token = await this.jwtService.signAsync(payload);
            return { access_token };
           
        } catch (error) {
            console.error("error al crear")
            if (error instanceof BadGatewayException) { throw error; }
            throw new Error(error)
        }

    }
    async logIn(email: string, password: string) {
        try {
            // buscar si esque existe
            const user = await this.prismaService.usuario.findUnique({
                where: {
                    email,
                },
            });
            if (!user) {
                throw new BadRequestException('Email invalido.');
            }
            const isPasswordMatch = await compare(password, user.password);//Compara una contraseña en texto plano con una contraseña encriptada (hash)
            if (!isPasswordMatch) {
                throw new BadGatewayException("malllll pass")
            }
            const payload = {
                email: user.email,
                //password: user.password// o lo que uses
                };
            const access_token = await this.jwtService.signAsync(payload);
            console.log("vesmoa dondemuere 4")
            return { access_token }
        } catch (error) {
            console.error("que hiciste!!!!! control Z",error)
        }
    }
   
}
