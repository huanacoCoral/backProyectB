import { CanActivate, ExecutionContext, Injectable, UnauthorizedException } from "@nestjs/common";
//import { JwtService } from "@nestjs/jwt";
import {Request} from'express'

@Injectable()
export class AuthGuard implements CanActivate {
    //nos deberia llegar -->Authorization: Bearer TU_TOKEN_AQUI
    constructor(
        /*private jwtService: JwtService*/){}
    async canActivate(context: ExecutionContext): Promise <boolean> {
         console.log('🔥 AuthGuard ejecutado');
         //console.log(context, "**-*-*-*-*9");
         
        const request = context.switchToHttp().getRequest();//obtenemos la peticion de http para leer header

    // ESTO ES CLAVE: Verás todos los headers en tu terminal
    console.log('--- HEADERS RECIBIDOS ---');
    console.log(request.headers); 
    console.log('-------------------------');
        const token = this.extractToken(request);
        const tokenObject = JSON.parse(this.extractToken(request)+'');
        console.log("tenemos tocken en baken",tokenObject.access_token);
        if (!token){
            console.log('no hay token');
            
            throw new UnauthorizedException();
        }
        try {
            /*const payload=await this.jwtService.verifyAsync(tokenObject.access_token,{
                secret: process.env.SECRET, // very
            })
            console.log("baken payload",payload);
            request.user = payload;*/
        } catch (error) {
            console.log('hubo un error con la solicitd,tiempo expiro: ',error);
             throw new UnauthorizedException();
             
        }
        return true;// todo sale bien
    }

    private extractToken(request: Request): string | undefined {
       // 1. Obtenemos el header
    const authHeader = request.headers.authorization;
    
    if (!authHeader) return undefined;

    // 2. Separamos por ESPACIO (' ')// tendremos ["Bearer", "12345"]
    const [type, token] = authHeader.split(' ')??[];// type ahora vale= "Bearer" --- token ahora vale "12345"
    
    // 3. Verificamos que sea tipo Bearer y que el token exista
    return type === 'Bearer' ? token : undefined;

    }

}   