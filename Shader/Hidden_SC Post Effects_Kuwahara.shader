//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Kuwahara" {
Properties {
}
SubShader {
 Pass {
  Name "Kuwahara"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 42982
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Radius;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
vec4 u_xlat2;
int u_xlati2;
bool u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat6;
int u_xlati6;
float u_xlat7;
int u_xlati11;
float u_xlat12;
int u_xlati12;
bool u_xlatb12;
int u_xlati16;
float u_xlat17;
bool u_xlatb17;
vec4 TempArray0[4];
vec4 TempArray1[4];
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = _Radius + 1.0;
    u_xlat1 = u_xlat1 * u_xlat1;
    TempArray0[0].xyz = vec3(0.0, 0.0, 0.0);
    TempArray0[1].xyz = vec3(0.0, 0.0, 0.0);
    TempArray0[2].xyz = vec3(0.0, 0.0, 0.0);
    TempArray0[3].xyz = vec3(0.0, 0.0, 0.0);
    TempArray1[0].xyz = vec3(0.0, 0.0, 0.0);
    TempArray1[1].xyz = vec3(0.0, 0.0, 0.0);
    TempArray1[2].xyz = vec3(0.0, 0.0, 0.0);
    TempArray1[3].xyz = vec3(0.0, 0.0, 0.0);
    u_xlati6 = int(_Radius);
    u_xlati11 = int((-_Radius));
    for(int u_xlati_loop_1 = u_xlati11 ; u_xlati_loop_1<=0 ; u_xlati_loop_1++)
    {
        u_xlat2.x = float(u_xlati_loop_1);
        u_xlat2.y = u_xlat2.x * _MainTex_TexelSize.y;
        for(int u_xlati_loop_2 = u_xlati11 ; u_xlati_loop_2<=0 ; u_xlati_loop_2++)
        {
            u_xlat17 = float(u_xlati_loop_2);
            u_xlat2.x = u_xlat17 * _MainTex_TexelSize.x;
            u_xlat2.xw = u_xlat2.xy + vs_TEXCOORD1.xy;
            u_xlat3 = textureLod(_MainTex, u_xlat2.xw, 0.0);
            u_xlat4.xyz = TempArray0[0].xyz;
            u_xlat4.xyz = u_xlat3.xyz + u_xlat4.xyz;
            TempArray0[0].xyz = u_xlat4.xyz;
            u_xlat4.xyz = TempArray1[0].xyz;
            u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat4.xyz;
            TempArray1[0].xyz = u_xlat3.xyz;
        }
    }
    for(int u_xlati_loop_3 = u_xlati11 ; u_xlati_loop_3<=0 ; u_xlati_loop_3++)
    {
        u_xlat2.x = float(u_xlati_loop_3);
        u_xlat2.y = u_xlat2.x * _MainTex_TexelSize.y;
        for(int u_xlati_loop_4 = 0 ; u_xlati6>=u_xlati_loop_4 ; u_xlati_loop_4++)
        {
            u_xlat17 = float(u_xlati_loop_4);
            u_xlat2.x = u_xlat17 * _MainTex_TexelSize.x;
            u_xlat2.xw = u_xlat2.xy + vs_TEXCOORD1.xy;
            u_xlat3 = textureLod(_MainTex, u_xlat2.xw, 0.0);
            u_xlat4.xyz = TempArray0[1].xyz;
            u_xlat4.xyz = u_xlat3.xyz + u_xlat4.xyz;
            TempArray0[1].xyz = u_xlat4.xyz;
            u_xlat4.xyz = TempArray1[1].xyz;
            u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat4.xyz;
            TempArray1[1].xyz = u_xlat3.xyz;
        }
    }
    for(int u_xlati_loop_5 = 0 ; u_xlati6>=u_xlati_loop_5 ; u_xlati_loop_5++)
    {
        u_xlat2.x = float(u_xlati_loop_5);
        u_xlat2.y = u_xlat2.x * _MainTex_TexelSize.y;
        for(int u_xlati_loop_6 = 0 ; u_xlati6>=u_xlati_loop_6 ; u_xlati_loop_6++)
        {
            u_xlat17 = float(u_xlati_loop_6);
            u_xlat2.x = u_xlat17 * _MainTex_TexelSize.x;
            u_xlat2.xw = u_xlat2.xy + vs_TEXCOORD1.xy;
            u_xlat3 = textureLod(_MainTex, u_xlat2.xw, 0.0);
            u_xlat4.xyz = TempArray0[2].xyz;
            u_xlat4.xyz = u_xlat3.xyz + u_xlat4.xyz;
            TempArray0[2].xyz = u_xlat4.xyz;
            u_xlat4.xyz = TempArray1[2].xyz;
            u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat4.xyz;
            TempArray1[2].xyz = u_xlat3.xyz;
        }
    }
    for(int u_xlati_loop_7 = 0 ; u_xlati6>=u_xlati_loop_7 ; u_xlati_loop_7++)
    {
        u_xlat2.x = float(u_xlati_loop_7);
        u_xlat2.y = u_xlat2.x * _MainTex_TexelSize.y;
        for(int u_xlati_loop_8 = u_xlati11 ; u_xlati_loop_8<=0 ; u_xlati_loop_8++)
        {
            u_xlat17 = float(u_xlati_loop_8);
            u_xlat2.x = u_xlat17 * _MainTex_TexelSize.x;
            u_xlat2.xw = u_xlat2.xy + vs_TEXCOORD1.xy;
            u_xlat3 = textureLod(_MainTex, u_xlat2.xw, 0.0);
            u_xlat4.xyz = TempArray0[3].xyz;
            u_xlat4.xyz = u_xlat3.xyz + u_xlat4.xyz;
            TempArray0[3].xyz = u_xlat4.xyz;
            u_xlat4.xyz = TempArray1[3].xyz;
            u_xlat3.xyz = u_xlat3.xyz * u_xlat3.xyz + u_xlat4.xyz;
            TempArray1[3].xyz = u_xlat3.xyz;
        }
    }
    u_xlat6.xyz = u_xlat0.xyz;
    u_xlat7 = float(1000000.0);
    for(int u_xlati_loop_9 = int(0) ; u_xlati_loop_9<4 ; u_xlati_loop_9++)
    {
        u_xlat3.xyz = TempArray0[u_xlati_loop_9].xyz;
        u_xlat3.xyz = u_xlat3.xyz / vec3(u_xlat1);
        TempArray0[u_xlati_loop_9].xyz = u_xlat3.xyz;
        u_xlat4.xyz = TempArray1[u_xlati_loop_9].xyz;
        u_xlat4.xyz = u_xlat4.xyz / vec3(u_xlat1);
        u_xlat4.xyz = (-u_xlat3.xyz) * u_xlat3.xyz + u_xlat4.xyz;
        TempArray1[u_xlati_loop_9].xyz = abs(u_xlat4.xyz);
        u_xlat12 = abs(u_xlat4.y) + abs(u_xlat4.x);
        u_xlat12 = abs(u_xlat4.z) + u_xlat12;
        u_xlatb17 = u_xlat12<u_xlat7;
        if(u_xlatb17){
            u_xlat6.xyz = u_xlat3.xyz;
            u_xlat7 = u_xlat12;
        }
    }
    SV_Target0.xyz = u_xlat6.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 477
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %462 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 22 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpMemberDecorate %27 1 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %135 DescriptorSet 135 
                                             OpDecorate %135 Binding 135 
                                             OpDecorate %462 Location 462 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeStruct %7 %6 
                                     %28 = OpTypePointer Uniform %27 
       Uniform struct {f32_4; f32;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 1 
                                     %32 = OpTypePointer Uniform %6 
                                 f32 %35 = OpConstant 3.674022E-40 
                                     %40 = OpTypeInt 32 0 
                                 u32 %41 = OpConstant 4 
                                     %42 = OpTypeArray %7 %41 
                                     %43 = OpTypePointer Private %42 
                   Private f32_4[4]* %44 = OpVariable Private 
                                 i32 %45 = OpConstant 0 
                                     %46 = OpTypeVector %6 3 
                                 f32 %47 = OpConstant 3.674022E-40 
                               f32_3 %48 = OpConstantComposite %47 %47 %47 
                                 i32 %55 = OpConstant 2 
                                 i32 %59 = OpConstant 3 
                   Private f32_4[4]* %63 = OpVariable Private 
                                     %76 = OpTypePointer Private %30 
                        Private i32* %77 = OpVariable Private 
                        Private i32* %81 = OpVariable Private 
                                     %86 = OpTypePointer Function %30 
                                     %95 = OpTypeBool 
                      Private f32_4* %97 = OpVariable Private 
                                u32 %100 = OpConstant 0 
                                u32 %104 = OpConstant 1 
                       Private f32* %118 = OpVariable Private 
                                    %132 = OpTypePointer Private %46 
                     Private f32_3* %133 = OpVariable Private 
           UniformConstant sampler* %135 = OpVariable UniformConstant 
                     Private f32_3* %142 = OpVariable Private 
                     Private f32_3* %388 = OpVariable Private 
                       Private f32* %391 = OpVariable Private 
                                f32 %392 = OpConstant 3.674022E-40 
                                i32 %400 = OpConstant 4 
                       Private f32* %435 = OpVariable Private 
                                u32 %443 = OpConstant 2 
                                    %449 = OpTypePointer Private %95 
                      Private bool* %450 = OpVariable Private 
                                    %461 = OpTypePointer Output %7 
                      Output f32_4* %462 = OpVariable Output 
                                u32 %466 = OpConstant 3 
                                    %469 = OpTypePointer Output %6 
                       Private i32* %472 = OpVariable Private 
                      Private bool* %473 = OpVariable Private 
                       Private i32* %474 = OpVariable Private 
                      Private bool* %475 = OpVariable Private 
                       Private i32* %476 = OpVariable Private 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                       Function i32* %87 = OpVariable Function 
                      Function i32* %109 = OpVariable Function 
                      Function i32* %169 = OpVariable Function 
                      Function i32* %187 = OpVariable Function 
                      Function i32* %242 = OpVariable Function 
                      Function i32* %260 = OpVariable Function 
                      Function i32* %315 = OpVariable Function 
                      Function i32* %333 = OpVariable Function 
                      Function i32* %393 = OpVariable Function 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Uniform f32* %33 = OpAccessChain %29 %31 
                                 f32 %34 = OpLoad %33 
                                 f32 %36 = OpFAdd %34 %35 
                                             OpStore %26 %36 
                                 f32 %37 = OpLoad %26 
                                 f32 %38 = OpLoad %26 
                                 f32 %39 = OpFMul %37 %38 
                                             OpStore %26 %39 
                      Private f32_4* %49 = OpAccessChain %44 %45 
                               f32_4 %50 = OpLoad %49 
                               f32_4 %51 = OpVectorShuffle %50 %48 4 5 6 3 
                                             OpStore %49 %51 
                      Private f32_4* %52 = OpAccessChain %44 %31 
                               f32_4 %53 = OpLoad %52 
                               f32_4 %54 = OpVectorShuffle %53 %48 4 5 6 3 
                                             OpStore %52 %54 
                      Private f32_4* %56 = OpAccessChain %44 %55 
                               f32_4 %57 = OpLoad %56 
                               f32_4 %58 = OpVectorShuffle %57 %48 4 5 6 3 
                                             OpStore %56 %58 
                      Private f32_4* %60 = OpAccessChain %44 %59 
                               f32_4 %61 = OpLoad %60 
                               f32_4 %62 = OpVectorShuffle %61 %48 4 5 6 3 
                                             OpStore %60 %62 
                      Private f32_4* %64 = OpAccessChain %63 %45 
                               f32_4 %65 = OpLoad %64 
                               f32_4 %66 = OpVectorShuffle %65 %48 4 5 6 3 
                                             OpStore %64 %66 
                      Private f32_4* %67 = OpAccessChain %63 %31 
                               f32_4 %68 = OpLoad %67 
                               f32_4 %69 = OpVectorShuffle %68 %48 4 5 6 3 
                                             OpStore %67 %69 
                      Private f32_4* %70 = OpAccessChain %63 %55 
                               f32_4 %71 = OpLoad %70 
                               f32_4 %72 = OpVectorShuffle %71 %48 4 5 6 3 
                                             OpStore %70 %72 
                      Private f32_4* %73 = OpAccessChain %63 %59 
                               f32_4 %74 = OpLoad %73 
                               f32_4 %75 = OpVectorShuffle %74 %48 4 5 6 3 
                                             OpStore %73 %75 
                        Uniform f32* %78 = OpAccessChain %29 %31 
                                 f32 %79 = OpLoad %78 
                                 i32 %80 = OpConvertFToS %79 
                                             OpStore %77 %80 
                        Uniform f32* %82 = OpAccessChain %29 %31 
                                 f32 %83 = OpLoad %82 
                                 f32 %84 = OpFNegate %83 
                                 i32 %85 = OpConvertFToS %84 
                                             OpStore %81 %85 
                                 i32 %88 = OpLoad %81 
                                             OpStore %87 %88 
                                             OpBranch %89 
                                     %89 = OpLabel 
                                             OpLoopMerge %91 %92 None 
                                             OpBranch %93 
                                     %93 = OpLabel 
                                 i32 %94 = OpLoad %87 
                                bool %96 = OpSLessThanEqual %94 %45 
                                             OpBranchConditional %96 %90 %91 
                                     %90 = OpLabel 
                                 i32 %98 = OpLoad %87 
                                 f32 %99 = OpConvertSToF %98 
                       Private f32* %101 = OpAccessChain %97 %100 
                                             OpStore %101 %99 
                       Private f32* %102 = OpAccessChain %97 %100 
                                f32 %103 = OpLoad %102 
                       Uniform f32* %105 = OpAccessChain %29 %45 %104 
                                f32 %106 = OpLoad %105 
                                f32 %107 = OpFMul %103 %106 
                       Private f32* %108 = OpAccessChain %97 %104 
                                             OpStore %108 %107 
                                i32 %110 = OpLoad %81 
                                             OpStore %109 %110 
                                             OpBranch %111 
                                    %111 = OpLabel 
                                             OpLoopMerge %113 %114 None 
                                             OpBranch %115 
                                    %115 = OpLabel 
                                i32 %116 = OpLoad %109 
                               bool %117 = OpSLessThanEqual %116 %45 
                                             OpBranchConditional %117 %112 %113 
                                    %112 = OpLabel 
                                i32 %119 = OpLoad %109 
                                f32 %120 = OpConvertSToF %119 
                                             OpStore %118 %120 
                                f32 %121 = OpLoad %118 
                       Uniform f32* %122 = OpAccessChain %29 %45 %100 
                                f32 %123 = OpLoad %122 
                                f32 %124 = OpFMul %121 %123 
                       Private f32* %125 = OpAccessChain %97 %100 
                                             OpStore %125 %124 
                              f32_4 %126 = OpLoad %97 
                              f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                              f32_2 %128 = OpLoad vs_TEXCOORD1 
                              f32_2 %129 = OpFAdd %127 %128 
                              f32_4 %130 = OpLoad %97 
                              f32_4 %131 = OpVectorShuffle %130 %129 4 1 2 5 
                                             OpStore %97 %131 
                read_only Texture2D %134 = OpLoad %12 
                            sampler %136 = OpLoad %135 
         read_only Texture2DSampled %137 = OpSampledImage %134 %136 
                              f32_4 %138 = OpLoad %97 
                              f32_2 %139 = OpVectorShuffle %138 %138 0 3 
                              f32_4 %140 = OpImageSampleExplicitLod %137 %139 Lod %7 
                              f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                             OpStore %133 %141 
                     Private f32_4* %143 = OpAccessChain %44 %45 
                              f32_4 %144 = OpLoad %143 
                              f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                             OpStore %142 %145 
                              f32_3 %146 = OpLoad %133 
                              f32_3 %147 = OpLoad %142 
                              f32_3 %148 = OpFAdd %146 %147 
                                             OpStore %142 %148 
                              f32_3 %149 = OpLoad %142 
                     Private f32_4* %150 = OpAccessChain %44 %45 
                              f32_4 %151 = OpLoad %150 
                              f32_4 %152 = OpVectorShuffle %151 %149 4 5 6 3 
                                             OpStore %150 %152 
                     Private f32_4* %153 = OpAccessChain %63 %45 
                              f32_4 %154 = OpLoad %153 
                              f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                                             OpStore %142 %155 
                              f32_3 %156 = OpLoad %133 
                              f32_3 %157 = OpLoad %133 
                              f32_3 %158 = OpFMul %156 %157 
                              f32_3 %159 = OpLoad %142 
                              f32_3 %160 = OpFAdd %158 %159 
                                             OpStore %133 %160 
                              f32_3 %161 = OpLoad %133 
                     Private f32_4* %162 = OpAccessChain %63 %45 
                              f32_4 %163 = OpLoad %162 
                              f32_4 %164 = OpVectorShuffle %163 %161 4 5 6 3 
                                             OpStore %162 %164 
                                             OpBranch %114 
                                    %114 = OpLabel 
                                i32 %165 = OpLoad %109 
                                i32 %166 = OpIAdd %165 %31 
                                             OpStore %109 %166 
                                             OpBranch %111 
                                    %113 = OpLabel 
                                             OpBranch %92 
                                     %92 = OpLabel 
                                i32 %167 = OpLoad %87 
                                i32 %168 = OpIAdd %167 %31 
                                             OpStore %87 %168 
                                             OpBranch %89 
                                     %91 = OpLabel 
                                i32 %170 = OpLoad %81 
                                             OpStore %169 %170 
                                             OpBranch %171 
                                    %171 = OpLabel 
                                             OpLoopMerge %173 %174 None 
                                             OpBranch %175 
                                    %175 = OpLabel 
                                i32 %176 = OpLoad %169 
                               bool %177 = OpSLessThanEqual %176 %45 
                                             OpBranchConditional %177 %172 %173 
                                    %172 = OpLabel 
                                i32 %178 = OpLoad %169 
                                f32 %179 = OpConvertSToF %178 
                       Private f32* %180 = OpAccessChain %97 %100 
                                             OpStore %180 %179 
                       Private f32* %181 = OpAccessChain %97 %100 
                                f32 %182 = OpLoad %181 
                       Uniform f32* %183 = OpAccessChain %29 %45 %104 
                                f32 %184 = OpLoad %183 
                                f32 %185 = OpFMul %182 %184 
                       Private f32* %186 = OpAccessChain %97 %104 
                                             OpStore %186 %185 
                                             OpStore %187 %45 
                                             OpBranch %188 
                                    %188 = OpLabel 
                                             OpLoopMerge %190 %191 None 
                                             OpBranch %192 
                                    %192 = OpLabel 
                                i32 %193 = OpLoad %77 
                                i32 %194 = OpLoad %187 
                               bool %195 = OpSGreaterThanEqual %193 %194 
                                             OpBranchConditional %195 %189 %190 
                                    %189 = OpLabel 
                                i32 %196 = OpLoad %187 
                                f32 %197 = OpConvertSToF %196 
                                             OpStore %118 %197 
                                f32 %198 = OpLoad %118 
                       Uniform f32* %199 = OpAccessChain %29 %45 %100 
                                f32 %200 = OpLoad %199 
                                f32 %201 = OpFMul %198 %200 
                       Private f32* %202 = OpAccessChain %97 %100 
                                             OpStore %202 %201 
                              f32_4 %203 = OpLoad %97 
                              f32_2 %204 = OpVectorShuffle %203 %203 0 1 
                              f32_2 %205 = OpLoad vs_TEXCOORD1 
                              f32_2 %206 = OpFAdd %204 %205 
                              f32_4 %207 = OpLoad %97 
                              f32_4 %208 = OpVectorShuffle %207 %206 4 1 2 5 
                                             OpStore %97 %208 
                read_only Texture2D %209 = OpLoad %12 
                            sampler %210 = OpLoad %135 
         read_only Texture2DSampled %211 = OpSampledImage %209 %210 
                              f32_4 %212 = OpLoad %97 
                              f32_2 %213 = OpVectorShuffle %212 %212 0 3 
                              f32_4 %214 = OpImageSampleExplicitLod %211 %213 Lod %7 
                              f32_3 %215 = OpVectorShuffle %214 %214 0 1 2 
                                             OpStore %133 %215 
                     Private f32_4* %216 = OpAccessChain %44 %31 
                              f32_4 %217 = OpLoad %216 
                              f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                             OpStore %142 %218 
                              f32_3 %219 = OpLoad %133 
                              f32_3 %220 = OpLoad %142 
                              f32_3 %221 = OpFAdd %219 %220 
                                             OpStore %142 %221 
                              f32_3 %222 = OpLoad %142 
                     Private f32_4* %223 = OpAccessChain %44 %31 
                              f32_4 %224 = OpLoad %223 
                              f32_4 %225 = OpVectorShuffle %224 %222 4 5 6 3 
                                             OpStore %223 %225 
                     Private f32_4* %226 = OpAccessChain %63 %31 
                              f32_4 %227 = OpLoad %226 
                              f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                             OpStore %142 %228 
                              f32_3 %229 = OpLoad %133 
                              f32_3 %230 = OpLoad %133 
                              f32_3 %231 = OpFMul %229 %230 
                              f32_3 %232 = OpLoad %142 
                              f32_3 %233 = OpFAdd %231 %232 
                                             OpStore %133 %233 
                              f32_3 %234 = OpLoad %133 
                     Private f32_4* %235 = OpAccessChain %63 %31 
                              f32_4 %236 = OpLoad %235 
                              f32_4 %237 = OpVectorShuffle %236 %234 4 5 6 3 
                                             OpStore %235 %237 
                                             OpBranch %191 
                                    %191 = OpLabel 
                                i32 %238 = OpLoad %187 
                                i32 %239 = OpIAdd %238 %31 
                                             OpStore %187 %239 
                                             OpBranch %188 
                                    %190 = OpLabel 
                                             OpBranch %174 
                                    %174 = OpLabel 
                                i32 %240 = OpLoad %169 
                                i32 %241 = OpIAdd %240 %31 
                                             OpStore %169 %241 
                                             OpBranch %171 
                                    %173 = OpLabel 
                                             OpStore %242 %45 
                                             OpBranch %243 
                                    %243 = OpLabel 
                                             OpLoopMerge %245 %246 None 
                                             OpBranch %247 
                                    %247 = OpLabel 
                                i32 %248 = OpLoad %77 
                                i32 %249 = OpLoad %242 
                               bool %250 = OpSGreaterThanEqual %248 %249 
                                             OpBranchConditional %250 %244 %245 
                                    %244 = OpLabel 
                                i32 %251 = OpLoad %242 
                                f32 %252 = OpConvertSToF %251 
                       Private f32* %253 = OpAccessChain %97 %100 
                                             OpStore %253 %252 
                       Private f32* %254 = OpAccessChain %97 %100 
                                f32 %255 = OpLoad %254 
                       Uniform f32* %256 = OpAccessChain %29 %45 %104 
                                f32 %257 = OpLoad %256 
                                f32 %258 = OpFMul %255 %257 
                       Private f32* %259 = OpAccessChain %97 %104 
                                             OpStore %259 %258 
                                             OpStore %260 %45 
                                             OpBranch %261 
                                    %261 = OpLabel 
                                             OpLoopMerge %263 %264 None 
                                             OpBranch %265 
                                    %265 = OpLabel 
                                i32 %266 = OpLoad %77 
                                i32 %267 = OpLoad %260 
                               bool %268 = OpSGreaterThanEqual %266 %267 
                                             OpBranchConditional %268 %262 %263 
                                    %262 = OpLabel 
                                i32 %269 = OpLoad %260 
                                f32 %270 = OpConvertSToF %269 
                                             OpStore %118 %270 
                                f32 %271 = OpLoad %118 
                       Uniform f32* %272 = OpAccessChain %29 %45 %100 
                                f32 %273 = OpLoad %272 
                                f32 %274 = OpFMul %271 %273 
                       Private f32* %275 = OpAccessChain %97 %100 
                                             OpStore %275 %274 
                              f32_4 %276 = OpLoad %97 
                              f32_2 %277 = OpVectorShuffle %276 %276 0 1 
                              f32_2 %278 = OpLoad vs_TEXCOORD1 
                              f32_2 %279 = OpFAdd %277 %278 
                              f32_4 %280 = OpLoad %97 
                              f32_4 %281 = OpVectorShuffle %280 %279 4 1 2 5 
                                             OpStore %97 %281 
                read_only Texture2D %282 = OpLoad %12 
                            sampler %283 = OpLoad %135 
         read_only Texture2DSampled %284 = OpSampledImage %282 %283 
                              f32_4 %285 = OpLoad %97 
                              f32_2 %286 = OpVectorShuffle %285 %285 0 3 
                              f32_4 %287 = OpImageSampleExplicitLod %284 %286 Lod %7 
                              f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                                             OpStore %133 %288 
                     Private f32_4* %289 = OpAccessChain %44 %55 
                              f32_4 %290 = OpLoad %289 
                              f32_3 %291 = OpVectorShuffle %290 %290 0 1 2 
                                             OpStore %142 %291 
                              f32_3 %292 = OpLoad %133 
                              f32_3 %293 = OpLoad %142 
                              f32_3 %294 = OpFAdd %292 %293 
                                             OpStore %142 %294 
                              f32_3 %295 = OpLoad %142 
                     Private f32_4* %296 = OpAccessChain %44 %55 
                              f32_4 %297 = OpLoad %296 
                              f32_4 %298 = OpVectorShuffle %297 %295 4 5 6 3 
                                             OpStore %296 %298 
                     Private f32_4* %299 = OpAccessChain %63 %55 
                              f32_4 %300 = OpLoad %299 
                              f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                             OpStore %142 %301 
                              f32_3 %302 = OpLoad %133 
                              f32_3 %303 = OpLoad %133 
                              f32_3 %304 = OpFMul %302 %303 
                              f32_3 %305 = OpLoad %142 
                              f32_3 %306 = OpFAdd %304 %305 
                                             OpStore %133 %306 
                              f32_3 %307 = OpLoad %133 
                     Private f32_4* %308 = OpAccessChain %63 %55 
                              f32_4 %309 = OpLoad %308 
                              f32_4 %310 = OpVectorShuffle %309 %307 4 5 6 3 
                                             OpStore %308 %310 
                                             OpBranch %264 
                                    %264 = OpLabel 
                                i32 %311 = OpLoad %260 
                                i32 %312 = OpIAdd %311 %31 
                                             OpStore %260 %312 
                                             OpBranch %261 
                                    %263 = OpLabel 
                                             OpBranch %246 
                                    %246 = OpLabel 
                                i32 %313 = OpLoad %242 
                                i32 %314 = OpIAdd %313 %31 
                                             OpStore %242 %314 
                                             OpBranch %243 
                                    %245 = OpLabel 
                                             OpStore %315 %45 
                                             OpBranch %316 
                                    %316 = OpLabel 
                                             OpLoopMerge %318 %319 None 
                                             OpBranch %320 
                                    %320 = OpLabel 
                                i32 %321 = OpLoad %77 
                                i32 %322 = OpLoad %315 
                               bool %323 = OpSGreaterThanEqual %321 %322 
                                             OpBranchConditional %323 %317 %318 
                                    %317 = OpLabel 
                                i32 %324 = OpLoad %315 
                                f32 %325 = OpConvertSToF %324 
                       Private f32* %326 = OpAccessChain %97 %100 
                                             OpStore %326 %325 
                       Private f32* %327 = OpAccessChain %97 %100 
                                f32 %328 = OpLoad %327 
                       Uniform f32* %329 = OpAccessChain %29 %45 %104 
                                f32 %330 = OpLoad %329 
                                f32 %331 = OpFMul %328 %330 
                       Private f32* %332 = OpAccessChain %97 %104 
                                             OpStore %332 %331 
                                i32 %334 = OpLoad %81 
                                             OpStore %333 %334 
                                             OpBranch %335 
                                    %335 = OpLabel 
                                             OpLoopMerge %337 %338 None 
                                             OpBranch %339 
                                    %339 = OpLabel 
                                i32 %340 = OpLoad %333 
                               bool %341 = OpSLessThanEqual %340 %45 
                                             OpBranchConditional %341 %336 %337 
                                    %336 = OpLabel 
                                i32 %342 = OpLoad %333 
                                f32 %343 = OpConvertSToF %342 
                                             OpStore %118 %343 
                                f32 %344 = OpLoad %118 
                       Uniform f32* %345 = OpAccessChain %29 %45 %100 
                                f32 %346 = OpLoad %345 
                                f32 %347 = OpFMul %344 %346 
                       Private f32* %348 = OpAccessChain %97 %100 
                                             OpStore %348 %347 
                              f32_4 %349 = OpLoad %97 
                              f32_2 %350 = OpVectorShuffle %349 %349 0 1 
                              f32_2 %351 = OpLoad vs_TEXCOORD1 
                              f32_2 %352 = OpFAdd %350 %351 
                              f32_4 %353 = OpLoad %97 
                              f32_4 %354 = OpVectorShuffle %353 %352 4 1 2 5 
                                             OpStore %97 %354 
                read_only Texture2D %355 = OpLoad %12 
                            sampler %356 = OpLoad %135 
         read_only Texture2DSampled %357 = OpSampledImage %355 %356 
                              f32_4 %358 = OpLoad %97 
                              f32_2 %359 = OpVectorShuffle %358 %358 0 3 
                              f32_4 %360 = OpImageSampleExplicitLod %357 %359 Lod %7 
                              f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                                             OpStore %133 %361 
                     Private f32_4* %362 = OpAccessChain %44 %59 
                              f32_4 %363 = OpLoad %362 
                              f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                             OpStore %142 %364 
                              f32_3 %365 = OpLoad %133 
                              f32_3 %366 = OpLoad %142 
                              f32_3 %367 = OpFAdd %365 %366 
                                             OpStore %142 %367 
                              f32_3 %368 = OpLoad %142 
                     Private f32_4* %369 = OpAccessChain %44 %59 
                              f32_4 %370 = OpLoad %369 
                              f32_4 %371 = OpVectorShuffle %370 %368 4 5 6 3 
                                             OpStore %369 %371 
                     Private f32_4* %372 = OpAccessChain %63 %59 
                              f32_4 %373 = OpLoad %372 
                              f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                             OpStore %142 %374 
                              f32_3 %375 = OpLoad %133 
                              f32_3 %376 = OpLoad %133 
                              f32_3 %377 = OpFMul %375 %376 
                              f32_3 %378 = OpLoad %142 
                              f32_3 %379 = OpFAdd %377 %378 
                                             OpStore %133 %379 
                              f32_3 %380 = OpLoad %133 
                     Private f32_4* %381 = OpAccessChain %63 %59 
                              f32_4 %382 = OpLoad %381 
                              f32_4 %383 = OpVectorShuffle %382 %380 4 5 6 3 
                                             OpStore %381 %383 
                                             OpBranch %338 
                                    %338 = OpLabel 
                                i32 %384 = OpLoad %333 
                                i32 %385 = OpIAdd %384 %31 
                                             OpStore %333 %385 
                                             OpBranch %335 
                                    %337 = OpLabel 
                                             OpBranch %319 
                                    %319 = OpLabel 
                                i32 %386 = OpLoad %315 
                                i32 %387 = OpIAdd %386 %31 
                                             OpStore %315 %387 
                                             OpBranch %316 
                                    %318 = OpLabel 
                              f32_4 %389 = OpLoad %9 
                              f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                             OpStore %388 %390 
                                             OpStore %391 %392 
                                             OpStore %393 %45 
                                             OpBranch %394 
                                    %394 = OpLabel 
                                             OpLoopMerge %396 %397 None 
                                             OpBranch %398 
                                    %398 = OpLabel 
                                i32 %399 = OpLoad %393 
                               bool %401 = OpSLessThan %399 %400 
                                             OpBranchConditional %401 %395 %396 
                                    %395 = OpLabel 
                                i32 %402 = OpLoad %393 
                     Private f32_4* %403 = OpAccessChain %44 %402 
                              f32_4 %404 = OpLoad %403 
                              f32_3 %405 = OpVectorShuffle %404 %404 0 1 2 
                                             OpStore %133 %405 
                              f32_3 %406 = OpLoad %133 
                                f32 %407 = OpLoad %26 
                              f32_3 %408 = OpCompositeConstruct %407 %407 %407 
                              f32_3 %409 = OpFDiv %406 %408 
                                             OpStore %133 %409 
                                i32 %410 = OpLoad %393 
                              f32_3 %411 = OpLoad %133 
                     Private f32_4* %412 = OpAccessChain %44 %410 
                              f32_4 %413 = OpLoad %412 
                              f32_4 %414 = OpVectorShuffle %413 %411 4 5 6 3 
                                             OpStore %412 %414 
                                i32 %415 = OpLoad %393 
                     Private f32_4* %416 = OpAccessChain %63 %415 
                              f32_4 %417 = OpLoad %416 
                              f32_3 %418 = OpVectorShuffle %417 %417 0 1 2 
                                             OpStore %142 %418 
                              f32_3 %419 = OpLoad %142 
                                f32 %420 = OpLoad %26 
                              f32_3 %421 = OpCompositeConstruct %420 %420 %420 
                              f32_3 %422 = OpFDiv %419 %421 
                                             OpStore %142 %422 
                              f32_3 %423 = OpLoad %133 
                              f32_3 %424 = OpFNegate %423 
                              f32_3 %425 = OpLoad %133 
                              f32_3 %426 = OpFMul %424 %425 
                              f32_3 %427 = OpLoad %142 
                              f32_3 %428 = OpFAdd %426 %427 
                                             OpStore %142 %428 
                                i32 %429 = OpLoad %393 
                              f32_3 %430 = OpLoad %142 
                              f32_3 %431 = OpExtInst %1 4 %430 
                     Private f32_4* %432 = OpAccessChain %63 %429 
                              f32_4 %433 = OpLoad %432 
                              f32_4 %434 = OpVectorShuffle %433 %431 4 5 6 3 
                                             OpStore %432 %434 
                       Private f32* %436 = OpAccessChain %142 %104 
                                f32 %437 = OpLoad %436 
                                f32 %438 = OpExtInst %1 4 %437 
                       Private f32* %439 = OpAccessChain %142 %100 
                                f32 %440 = OpLoad %439 
                                f32 %441 = OpExtInst %1 4 %440 
                                f32 %442 = OpFAdd %438 %441 
                                             OpStore %435 %442 
                       Private f32* %444 = OpAccessChain %142 %443 
                                f32 %445 = OpLoad %444 
                                f32 %446 = OpExtInst %1 4 %445 
                                f32 %447 = OpLoad %435 
                                f32 %448 = OpFAdd %446 %447 
                                             OpStore %435 %448 
                                f32 %451 = OpLoad %435 
                                f32 %452 = OpLoad %391 
                               bool %453 = OpFOrdLessThan %451 %452 
                                             OpStore %450 %453 
                               bool %454 = OpLoad %450 
                                             OpSelectionMerge %456 None 
                                             OpBranchConditional %454 %455 %456 
                                    %455 = OpLabel 
                              f32_3 %457 = OpLoad %133 
                                             OpStore %388 %457 
                                f32 %458 = OpLoad %435 
                                             OpStore %391 %458 
                                             OpBranch %456 
                                    %456 = OpLabel 
                                             OpBranch %397 
                                    %397 = OpLabel 
                                i32 %459 = OpLoad %393 
                                i32 %460 = OpIAdd %459 %31 
                                             OpStore %393 %460 
                                             OpBranch %394 
                                    %396 = OpLabel 
                              f32_3 %463 = OpLoad %388 
                              f32_4 %464 = OpLoad %462 
                              f32_4 %465 = OpVectorShuffle %464 %463 4 5 6 3 
                                             OpStore %462 %465 
                       Private f32* %467 = OpAccessChain %9 %466 
                                f32 %468 = OpLoad %467 
                        Output f32* %470 = OpAccessChain %462 %466 
                                             OpStore %470 %468 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
 Pass {
  Name "Kuwahara (Depth-based)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 117518
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	float _RenderViewportScaleFactor;
in  vec3 in_POSITION0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
vec2 u_xlat0;
void main()
{
    gl_Position.xy = in_POSITION0.xy;
    gl_Position.zw = vec2(0.0, 1.0);
    u_xlat0.xy = in_POSITION0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(_RenderViewportScaleFactor);
    vs_TEXCOORD0.xy = in_POSITION0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#ifdef GL_ARB_shader_bit_encoding
#extension GL_ARB_shader_bit_encoding : enable
#endif

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_OrthoParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 _MainTex_TexelSize;
uniform 	float _Radius;
uniform 	vec4 _FadeParams;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _CameraDepthTexture;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec4 u_xlat3;
bool u_xlatb3;
vec4 u_xlat4;
bool u_xlatb4;
float u_xlat6;
float u_xlat7;
int u_xlati7;
bool u_xlatb7;
float u_xlat11;
int u_xlati11;
vec2 u_xlat12;
bool u_xlatb12;
float u_xlat16;
int u_xlati16;
float u_xlat18;
vec4 TempArray0[4];
vec4 TempArray1[4];
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = texture(_CameraDepthTexture, vs_TEXCOORD1.xy);
    u_xlat6 = (-unity_OrthoParams.w) + 1.0;
    u_xlat1.x = u_xlat1.x * _ZBufferParams.x;
    u_xlat11 = (-unity_OrthoParams.w) * u_xlat1.x + 1.0;
    u_xlat1.x = u_xlat6 * u_xlat1.x + _ZBufferParams.y;
    u_xlat1.x = u_xlat11 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _ProjectionParams.z + (-_ProjectionParams.y);
    u_xlat6 = (-u_xlat1.x) + 1.0;
    u_xlat6 = _ZBufferParams.z * u_xlat6 + _ZBufferParams.w;
    u_xlat6 = (-u_xlat6) * _ProjectionParams.w + _ProjectionParams.z;
    u_xlat6 = (-u_xlat1.x) + u_xlat6;
    u_xlat1.x = unity_OrthoParams.w * u_xlat6 + u_xlat1.x;
    u_xlat1.x = (-u_xlat1.x) + _FadeParams.y;
    u_xlat6 = (-_FadeParams.x) + _FadeParams.y;
    u_xlat1.x = u_xlat1.x / u_xlat6;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat6 = _Radius + 1.0;
    u_xlat6 = u_xlat6 * u_xlat6;
    TempArray0[0].xyz = vec3(0.0, 0.0, 0.0);
    TempArray0[1].xyz = vec3(0.0, 0.0, 0.0);
    TempArray0[2].xyz = vec3(0.0, 0.0, 0.0);
    TempArray0[3].xyz = vec3(0.0, 0.0, 0.0);
    TempArray1[0].xyz = vec3(0.0, 0.0, 0.0);
    TempArray1[1].xyz = vec3(0.0, 0.0, 0.0);
    TempArray1[2].xyz = vec3(0.0, 0.0, 0.0);
    TempArray1[3].xyz = vec3(0.0, 0.0, 0.0);
    u_xlati11 = int(_Radius);
    u_xlati16 = int((-_Radius));
    for(int u_xlati_loop_1 = u_xlati16 ; u_xlati_loop_1<=0 ; u_xlati_loop_1++)
    {
        u_xlat7 = float(u_xlati_loop_1);
        u_xlat3.y = u_xlat7 * _MainTex_TexelSize.y;
        for(int u_xlati_loop_2 = u_xlati16 ; u_xlati_loop_2<=0 ; u_xlati_loop_2++)
        {
            u_xlat12.x = float(u_xlati_loop_2);
            u_xlat3.x = u_xlat12.x * _MainTex_TexelSize.x;
            u_xlat12.xy = u_xlat3.xy + vs_TEXCOORD1.xy;
            u_xlat4 = textureLod(_MainTex, u_xlat12.xy, 0.0);
            u_xlat3.xzw = TempArray0[0].xyz;
            u_xlat3.xzw = u_xlat4.xyz + u_xlat3.xzw;
            TempArray0[0].xyz = u_xlat3.xzw;
            u_xlat3.xzw = TempArray1[0].xyz;
            u_xlat3.xzw = u_xlat4.xyz * u_xlat4.xyz + u_xlat3.xzw;
            TempArray1[0].xyz = u_xlat3.xzw;
        }
    }
    for(int u_xlati_loop_3 = u_xlati16 ; u_xlati_loop_3<=0 ; u_xlati_loop_3++)
    {
        u_xlat7 = float(u_xlati_loop_3);
        u_xlat3.y = u_xlat7 * _MainTex_TexelSize.y;
        for(int u_xlati_loop_4 = 0 ; u_xlati11>=u_xlati_loop_4 ; u_xlati_loop_4++)
        {
            u_xlat12.x = float(u_xlati_loop_4);
            u_xlat3.x = u_xlat12.x * _MainTex_TexelSize.x;
            u_xlat12.xy = u_xlat3.xy + vs_TEXCOORD1.xy;
            u_xlat4 = textureLod(_MainTex, u_xlat12.xy, 0.0);
            u_xlat3.xzw = TempArray0[1].xyz;
            u_xlat3.xzw = u_xlat4.xyz + u_xlat3.xzw;
            TempArray0[1].xyz = u_xlat3.xzw;
            u_xlat3.xzw = TempArray1[1].xyz;
            u_xlat3.xzw = u_xlat4.xyz * u_xlat4.xyz + u_xlat3.xzw;
            TempArray1[1].xyz = u_xlat3.xzw;
        }
    }
    for(int u_xlati_loop_5 = 0 ; u_xlati11>=u_xlati_loop_5 ; u_xlati_loop_5++)
    {
        u_xlat7 = float(u_xlati_loop_5);
        u_xlat3.y = u_xlat7 * _MainTex_TexelSize.y;
        for(int u_xlati_loop_6 = 0 ; u_xlati11>=u_xlati_loop_6 ; u_xlati_loop_6++)
        {
            u_xlat12.x = float(u_xlati_loop_6);
            u_xlat3.x = u_xlat12.x * _MainTex_TexelSize.x;
            u_xlat12.xy = u_xlat3.xy + vs_TEXCOORD1.xy;
            u_xlat4 = textureLod(_MainTex, u_xlat12.xy, 0.0);
            u_xlat3.xzw = TempArray0[2].xyz;
            u_xlat3.xzw = u_xlat4.xyz + u_xlat3.xzw;
            TempArray0[2].xyz = u_xlat3.xzw;
            u_xlat3.xzw = TempArray1[2].xyz;
            u_xlat3.xzw = u_xlat4.xyz * u_xlat4.xyz + u_xlat3.xzw;
            TempArray1[2].xyz = u_xlat3.xzw;
        }
    }
    for(int u_xlati_loop_7 = 0 ; u_xlati11>=u_xlati_loop_7 ; u_xlati_loop_7++)
    {
        u_xlat7 = float(u_xlati_loop_7);
        u_xlat3.y = u_xlat7 * _MainTex_TexelSize.y;
        for(int u_xlati_loop_8 = u_xlati16 ; u_xlati_loop_8<=0 ; u_xlati_loop_8++)
        {
            u_xlat12.x = float(u_xlati_loop_8);
            u_xlat3.x = u_xlat12.x * _MainTex_TexelSize.x;
            u_xlat12.xy = u_xlat3.xy + vs_TEXCOORD1.xy;
            u_xlat4 = textureLod(_MainTex, u_xlat12.xy, 0.0);
            u_xlat3.xzw = TempArray0[3].xyz;
            u_xlat3.xzw = u_xlat4.xyz + u_xlat3.xzw;
            TempArray0[3].xyz = u_xlat3.xzw;
            u_xlat3.xzw = TempArray1[3].xyz;
            u_xlat3.xzw = u_xlat4.xyz * u_xlat4.xyz + u_xlat3.xzw;
            TempArray1[3].xyz = u_xlat3.xzw;
        }
    }
    u_xlat2.xyz = u_xlat0.xyz;
    u_xlat16 = float(1000000.0);
    for(int u_xlati_loop_9 = int(0) ; u_xlati_loop_9<4 ; u_xlati_loop_9++)
    {
        u_xlat3.xyz = TempArray0[u_xlati_loop_9].xyz;
        u_xlat3.xyz = u_xlat3.xyz / vec3(u_xlat6);
        TempArray0[u_xlati_loop_9].xyz = u_xlat3.xyz;
        u_xlat4.xyz = TempArray1[u_xlati_loop_9].xyz;
        u_xlat4.xyz = u_xlat4.xyz / vec3(u_xlat6);
        u_xlat4.xyz = (-u_xlat3.xyz) * u_xlat3.xyz + u_xlat4.xyz;
        TempArray1[u_xlati_loop_9].xyz = abs(u_xlat4.xyz);
        u_xlat18 = abs(u_xlat4.y) + abs(u_xlat4.x);
        u_xlat18 = abs(u_xlat4.z) + u_xlat18;
        u_xlatb4 = u_xlat18<u_xlat16;
        if(u_xlatb4){
            u_xlat2.xyz = u_xlat3.xyz;
            u_xlat16 = u_xlat18;
        }
    }
    u_xlat2.w = u_xlat0.w;
    u_xlat0 = u_xlat0 + (-u_xlat2);
    SV_Target0 = u_xlat1.xxxx * u_xlat0 + u_xlat2;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 67
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Vertex %4 "main" %13 %18 %45 %55 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                             OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                             OpDecorate %11 Block 
                                             OpDecorate %18 Location 18 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpMemberDecorate %47 0 Offset 47 
                                             OpDecorate %47 Block 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate vs_TEXCOORD0 Location 55 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypeInt 32 0 
                                  u32 %9 = OpConstant 1 
                                     %10 = OpTypeArray %6 %9 
                                     %11 = OpTypeStruct %7 %6 %10 
                                     %12 = OpTypePointer Output %11 
Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                     %14 = OpTypeInt 32 1 
                                 i32 %15 = OpConstant 0 
                                     %16 = OpTypeVector %6 3 
                                     %17 = OpTypePointer Input %16 
                        Input f32_3* %18 = OpVariable Input 
                                     %19 = OpTypeVector %6 2 
                                     %22 = OpTypePointer Output %7 
                                 f32 %26 = OpConstant 3.674022E-40 
                                 f32 %27 = OpConstant 3.674022E-40 
                               f32_2 %28 = OpConstantComposite %26 %27 
                                     %32 = OpTypePointer Private %19 
                      Private f32_2* %33 = OpVariable Private 
                               f32_2 %36 = OpConstantComposite %27 %27 
                                 f32 %39 = OpConstant 3.674022E-40 
                                 f32 %40 = OpConstant 3.674022E-40 
                               f32_2 %41 = OpConstantComposite %39 %40 
                                     %44 = OpTypePointer Output %19 
              Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                     %47 = OpTypeStruct %6 
                                     %48 = OpTypePointer Uniform %47 
              Uniform struct {f32;}* %49 = OpVariable Uniform 
                                     %50 = OpTypePointer Uniform %6 
              Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                               f32_2 %59 = OpConstantComposite %39 %39 
                                     %61 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_3 %20 = OpLoad %18 
                               f32_2 %21 = OpVectorShuffle %20 %20 0 1 
                       Output f32_4* %23 = OpAccessChain %13 %15 
                               f32_4 %24 = OpLoad %23 
                               f32_4 %25 = OpVectorShuffle %24 %21 4 5 2 3 
                                             OpStore %23 %25 
                       Output f32_4* %29 = OpAccessChain %13 %15 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpVectorShuffle %30 %28 0 1 4 5 
                                             OpStore %29 %31 
                               f32_3 %34 = OpLoad %18 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_2 %37 = OpFAdd %35 %36 
                                             OpStore %33 %37 
                               f32_2 %38 = OpLoad %33 
                               f32_2 %42 = OpFMul %38 %41 
                               f32_2 %43 = OpFAdd %42 %28 
                                             OpStore %33 %43 
                               f32_2 %46 = OpLoad %33 
                        Uniform f32* %51 = OpAccessChain %49 %15 
                                 f32 %52 = OpLoad %51 
                               f32_2 %53 = OpCompositeConstruct %52 %52 
                               f32_2 %54 = OpFMul %46 %53 
                                             OpStore vs_TEXCOORD1 %54 
                               f32_3 %56 = OpLoad %18 
                               f32_2 %57 = OpVectorShuffle %56 %56 0 1 
                               f32_2 %58 = OpFMul %57 %41 
                               f32_2 %60 = OpFAdd %58 %59 
                                             OpStore vs_TEXCOORD0 %60 
                         Output f32* %62 = OpAccessChain %13 %15 %9 
                                 f32 %63 = OpLoad %62 
                                 f32 %64 = OpFNegate %63 
                         Output f32* %65 = OpAccessChain %13 %15 %9 
                                             OpStore %65 %64 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 602
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %589 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 22 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpMemberDecorate %38 0 Offset 38 
                                                      OpMemberDecorate %38 1 Offset 38 
                                                      OpMemberDecorate %38 2 Offset 38 
                                                      OpMemberDecorate %38 3 Offset 38 
                                                      OpMemberDecorate %38 4 Offset 38 
                                                      OpMemberDecorate %38 5 Offset 38 
                                                      OpDecorate %38 Block 
                                                      OpDecorate %40 DescriptorSet 40 
                                                      OpDecorate %40 Binding 40 
                                                      OpDecorate %589 Location 589 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %11 = OpTypePointer UniformConstant %10 
         UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                              %14 = OpTypeSampler 
                                              %15 = OpTypePointer UniformConstant %14 
                     UniformConstant sampler* %16 = OpVariable UniformConstant 
                                              %18 = OpTypeSampledImage %10 
                                              %20 = OpTypeVector %6 2 
                                              %21 = OpTypePointer Input %20 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                              %25 = OpTypePointer Private %6 
                                 Private f32* %26 = OpVariable Private 
         UniformConstant read_only Texture2D* %27 = OpVariable UniformConstant 
                     UniformConstant sampler* %29 = OpVariable UniformConstant 
                                              %34 = OpTypeInt 32 0 
                                          u32 %35 = OpConstant 0 
                                 Private f32* %37 = OpVariable Private 
                                              %38 = OpTypeStruct %7 %7 %7 %7 %6 %7 
                                              %39 = OpTypePointer Uniform %38 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32; f32_4;}* %40 = OpVariable Uniform 
                                              %41 = OpTypeInt 32 1 
                                          i32 %42 = OpConstant 1 
                                          u32 %43 = OpConstant 3 
                                              %44 = OpTypePointer Uniform %6 
                                          f32 %48 = OpConstant 3.674022E-40 
                                          i32 %51 = OpConstant 2 
                                 Private f32* %55 = OpVariable Private 
                                          u32 %65 = OpConstant 1 
                                          i32 %73 = OpConstant 0 
                                          u32 %74 = OpConstant 2 
                                         i32 %112 = OpConstant 5 
                                         f32 %126 = OpConstant 3.674022E-40 
                                         i32 %128 = OpConstant 4 
                                         u32 %135 = OpConstant 4 
                                             %136 = OpTypeArray %7 %135 
                                             %137 = OpTypePointer Private %136 
                           Private f32_4[4]* %138 = OpVariable Private 
                                             %139 = OpTypeVector %6 3 
                                       f32_3 %140 = OpConstantComposite %126 %126 %126 
                                         i32 %150 = OpConstant 3 
                           Private f32_4[4]* %154 = OpVariable Private 
                                             %167 = OpTypePointer Private %41 
                                Private i32* %168 = OpVariable Private 
                                Private i32* %172 = OpVariable Private 
                                             %177 = OpTypePointer Function %41 
                                             %186 = OpTypeBool 
                                Private f32* %188 = OpVariable Private 
                              Private f32_4* %191 = OpVariable Private 
                                             %206 = OpTypePointer Private %20 
                              Private f32_2* %207 = OpVariable Private 
                                             %229 = OpTypePointer Private %139 
                              Private f32_3* %230 = OpVariable Private 
                              Private f32_4* %497 = OpVariable Private 
                                Private f32* %502 = OpVariable Private 
                                         f32 %503 = OpConstant 3.674022E-40 
                                Private f32* %553 = OpVariable Private 
                                             %566 = OpTypePointer Private %186 
                               Private bool* %567 = OpVariable Private 
                                             %588 = OpTypePointer Output %7 
                               Output f32_4* %589 = OpVariable Output 
                                Private i32* %597 = OpVariable Private 
                               Private bool* %598 = OpVariable Private 
                                Private i32* %599 = OpVariable Private 
                               Private bool* %600 = OpVariable Private 
                               Private bool* %601 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %178 = OpVariable Function 
                               Function i32* %197 = OpVariable Function 
                               Function i32* %263 = OpVariable Function 
                               Function i32* %279 = OpVariable Function 
                               Function i32* %341 = OpVariable Function 
                               Function i32* %357 = OpVariable Function 
                               Function i32* %419 = OpVariable Function 
                               Function i32* %435 = OpVariable Function 
                               Function i32* %504 = OpVariable Function 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD1 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                                      OpStore %9 %24 
                          read_only Texture2D %28 = OpLoad %27 
                                      sampler %30 = OpLoad %29 
                   read_only Texture2DSampled %31 = OpSampledImage %28 %30 
                                        f32_2 %32 = OpLoad vs_TEXCOORD1 
                                        f32_4 %33 = OpImageSampleImplicitLod %31 %32 
                                          f32 %36 = OpCompositeExtract %33 0 
                                                      OpStore %26 %36 
                                 Uniform f32* %45 = OpAccessChain %40 %42 %43 
                                          f32 %46 = OpLoad %45 
                                          f32 %47 = OpFNegate %46 
                                          f32 %49 = OpFAdd %47 %48 
                                                      OpStore %37 %49 
                                          f32 %50 = OpLoad %26 
                                 Uniform f32* %52 = OpAccessChain %40 %51 %35 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpFMul %50 %53 
                                                      OpStore %26 %54 
                                 Uniform f32* %56 = OpAccessChain %40 %42 %43 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpFNegate %57 
                                          f32 %59 = OpLoad %26 
                                          f32 %60 = OpFMul %58 %59 
                                          f32 %61 = OpFAdd %60 %48 
                                                      OpStore %55 %61 
                                          f32 %62 = OpLoad %37 
                                          f32 %63 = OpLoad %26 
                                          f32 %64 = OpFMul %62 %63 
                                 Uniform f32* %66 = OpAccessChain %40 %51 %65 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFAdd %64 %67 
                                                      OpStore %26 %68 
                                          f32 %69 = OpLoad %55 
                                          f32 %70 = OpLoad %26 
                                          f32 %71 = OpFDiv %69 %70 
                                                      OpStore %26 %71 
                                          f32 %72 = OpLoad %26 
                                 Uniform f32* %75 = OpAccessChain %40 %73 %74 
                                          f32 %76 = OpLoad %75 
                                          f32 %77 = OpFMul %72 %76 
                                 Uniform f32* %78 = OpAccessChain %40 %73 %65 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                          f32 %81 = OpFAdd %77 %80 
                                                      OpStore %26 %81 
                                          f32 %82 = OpLoad %26 
                                          f32 %83 = OpFNegate %82 
                                          f32 %84 = OpFAdd %83 %48 
                                                      OpStore %37 %84 
                                 Uniform f32* %85 = OpAccessChain %40 %51 %74 
                                          f32 %86 = OpLoad %85 
                                          f32 %87 = OpLoad %37 
                                          f32 %88 = OpFMul %86 %87 
                                 Uniform f32* %89 = OpAccessChain %40 %51 %43 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFAdd %88 %90 
                                                      OpStore %37 %91 
                                          f32 %92 = OpLoad %37 
                                          f32 %93 = OpFNegate %92 
                                 Uniform f32* %94 = OpAccessChain %40 %73 %43 
                                          f32 %95 = OpLoad %94 
                                          f32 %96 = OpFMul %93 %95 
                                 Uniform f32* %97 = OpAccessChain %40 %73 %74 
                                          f32 %98 = OpLoad %97 
                                          f32 %99 = OpFAdd %96 %98 
                                                      OpStore %37 %99 
                                         f32 %100 = OpLoad %26 
                                         f32 %101 = OpFNegate %100 
                                         f32 %102 = OpLoad %37 
                                         f32 %103 = OpFAdd %101 %102 
                                                      OpStore %37 %103 
                                Uniform f32* %104 = OpAccessChain %40 %42 %43 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpLoad %37 
                                         f32 %107 = OpFMul %105 %106 
                                         f32 %108 = OpLoad %26 
                                         f32 %109 = OpFAdd %107 %108 
                                                      OpStore %26 %109 
                                         f32 %110 = OpLoad %26 
                                         f32 %111 = OpFNegate %110 
                                Uniform f32* %113 = OpAccessChain %40 %112 %65 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFAdd %111 %114 
                                                      OpStore %26 %115 
                                Uniform f32* %116 = OpAccessChain %40 %112 %35 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                Uniform f32* %119 = OpAccessChain %40 %112 %65 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFAdd %118 %120 
                                                      OpStore %37 %121 
                                         f32 %122 = OpLoad %26 
                                         f32 %123 = OpLoad %37 
                                         f32 %124 = OpFDiv %122 %123 
                                                      OpStore %26 %124 
                                         f32 %125 = OpLoad %26 
                                         f32 %127 = OpExtInst %1 43 %125 %126 %48 
                                                      OpStore %26 %127 
                                Uniform f32* %129 = OpAccessChain %40 %128 
                                         f32 %130 = OpLoad %129 
                                         f32 %131 = OpFAdd %130 %48 
                                                      OpStore %37 %131 
                                         f32 %132 = OpLoad %37 
                                         f32 %133 = OpLoad %37 
                                         f32 %134 = OpFMul %132 %133 
                                                      OpStore %37 %134 
                              Private f32_4* %141 = OpAccessChain %138 %73 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpVectorShuffle %142 %140 4 5 6 3 
                                                      OpStore %141 %143 
                              Private f32_4* %144 = OpAccessChain %138 %42 
                                       f32_4 %145 = OpLoad %144 
                                       f32_4 %146 = OpVectorShuffle %145 %140 4 5 6 3 
                                                      OpStore %144 %146 
                              Private f32_4* %147 = OpAccessChain %138 %51 
                                       f32_4 %148 = OpLoad %147 
                                       f32_4 %149 = OpVectorShuffle %148 %140 4 5 6 3 
                                                      OpStore %147 %149 
                              Private f32_4* %151 = OpAccessChain %138 %150 
                                       f32_4 %152 = OpLoad %151 
                                       f32_4 %153 = OpVectorShuffle %152 %140 4 5 6 3 
                                                      OpStore %151 %153 
                              Private f32_4* %155 = OpAccessChain %154 %73 
                                       f32_4 %156 = OpLoad %155 
                                       f32_4 %157 = OpVectorShuffle %156 %140 4 5 6 3 
                                                      OpStore %155 %157 
                              Private f32_4* %158 = OpAccessChain %154 %42 
                                       f32_4 %159 = OpLoad %158 
                                       f32_4 %160 = OpVectorShuffle %159 %140 4 5 6 3 
                                                      OpStore %158 %160 
                              Private f32_4* %161 = OpAccessChain %154 %51 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpVectorShuffle %162 %140 4 5 6 3 
                                                      OpStore %161 %163 
                              Private f32_4* %164 = OpAccessChain %154 %150 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpVectorShuffle %165 %140 4 5 6 3 
                                                      OpStore %164 %166 
                                Uniform f32* %169 = OpAccessChain %40 %128 
                                         f32 %170 = OpLoad %169 
                                         i32 %171 = OpConvertFToS %170 
                                                      OpStore %168 %171 
                                Uniform f32* %173 = OpAccessChain %40 %128 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                         i32 %176 = OpConvertFToS %175 
                                                      OpStore %172 %176 
                                         i32 %179 = OpLoad %172 
                                                      OpStore %178 %179 
                                                      OpBranch %180 
                                             %180 = OpLabel 
                                                      OpLoopMerge %182 %183 None 
                                                      OpBranch %184 
                                             %184 = OpLabel 
                                         i32 %185 = OpLoad %178 
                                        bool %187 = OpSLessThanEqual %185 %73 
                                                      OpBranchConditional %187 %181 %182 
                                             %181 = OpLabel 
                                         i32 %189 = OpLoad %178 
                                         f32 %190 = OpConvertSToF %189 
                                                      OpStore %188 %190 
                                         f32 %192 = OpLoad %188 
                                Uniform f32* %193 = OpAccessChain %40 %150 %65 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFMul %192 %194 
                                Private f32* %196 = OpAccessChain %191 %65 
                                                      OpStore %196 %195 
                                         i32 %198 = OpLoad %172 
                                                      OpStore %197 %198 
                                                      OpBranch %199 
                                             %199 = OpLabel 
                                                      OpLoopMerge %201 %202 None 
                                                      OpBranch %203 
                                             %203 = OpLabel 
                                         i32 %204 = OpLoad %197 
                                        bool %205 = OpSLessThanEqual %204 %73 
                                                      OpBranchConditional %205 %200 %201 
                                             %200 = OpLabel 
                                         i32 %208 = OpLoad %197 
                                         f32 %209 = OpConvertSToF %208 
                                Private f32* %210 = OpAccessChain %207 %35 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %207 %35 
                                         f32 %212 = OpLoad %211 
                                Uniform f32* %213 = OpAccessChain %40 %150 %35 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFMul %212 %214 
                                Private f32* %216 = OpAccessChain %191 %35 
                                                      OpStore %216 %215 
                                       f32_4 %217 = OpLoad %191 
                                       f32_2 %218 = OpVectorShuffle %217 %217 0 1 
                                       f32_2 %219 = OpLoad vs_TEXCOORD1 
                                       f32_2 %220 = OpFAdd %218 %219 
                                                      OpStore %207 %220 
                         read_only Texture2D %221 = OpLoad %12 
                                     sampler %222 = OpLoad %29 
                  read_only Texture2DSampled %223 = OpSampledImage %221 %222 
                                       f32_2 %224 = OpLoad %207 
                                       f32_4 %225 = OpImageSampleExplicitLod %223 %224 Lod %7 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 2 
                                       f32_4 %227 = OpLoad %191 
                                       f32_4 %228 = OpVectorShuffle %227 %226 4 1 5 6 
                                                      OpStore %191 %228 
                              Private f32_4* %231 = OpAccessChain %138 %73 
                                       f32_4 %232 = OpLoad %231 
                                       f32_3 %233 = OpVectorShuffle %232 %232 0 1 2 
                                                      OpStore %230 %233 
                                       f32_4 %234 = OpLoad %191 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 2 3 
                                       f32_3 %236 = OpLoad %230 
                                       f32_3 %237 = OpFAdd %235 %236 
                                                      OpStore %230 %237 
                                       f32_3 %238 = OpLoad %230 
                              Private f32_4* %239 = OpAccessChain %138 %73 
                                       f32_4 %240 = OpLoad %239 
                                       f32_4 %241 = OpVectorShuffle %240 %238 4 5 6 3 
                                                      OpStore %239 %241 
                              Private f32_4* %242 = OpAccessChain %154 %73 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                                      OpStore %230 %244 
                                       f32_4 %245 = OpLoad %191 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 2 3 
                                       f32_4 %247 = OpLoad %191 
                                       f32_3 %248 = OpVectorShuffle %247 %247 0 2 3 
                                       f32_3 %249 = OpFMul %246 %248 
                                       f32_3 %250 = OpLoad %230 
                                       f32_3 %251 = OpFAdd %249 %250 
                                       f32_4 %252 = OpLoad %191 
                                       f32_4 %253 = OpVectorShuffle %252 %251 4 1 5 6 
                                                      OpStore %191 %253 
                                       f32_4 %254 = OpLoad %191 
                                       f32_3 %255 = OpVectorShuffle %254 %254 0 2 3 
                              Private f32_4* %256 = OpAccessChain %154 %73 
                                       f32_4 %257 = OpLoad %256 
                                       f32_4 %258 = OpVectorShuffle %257 %255 4 5 6 3 
                                                      OpStore %256 %258 
                                                      OpBranch %202 
                                             %202 = OpLabel 
                                         i32 %259 = OpLoad %197 
                                         i32 %260 = OpIAdd %259 %42 
                                                      OpStore %197 %260 
                                                      OpBranch %199 
                                             %201 = OpLabel 
                                                      OpBranch %183 
                                             %183 = OpLabel 
                                         i32 %261 = OpLoad %178 
                                         i32 %262 = OpIAdd %261 %42 
                                                      OpStore %178 %262 
                                                      OpBranch %180 
                                             %182 = OpLabel 
                                         i32 %264 = OpLoad %172 
                                                      OpStore %263 %264 
                                                      OpBranch %265 
                                             %265 = OpLabel 
                                                      OpLoopMerge %267 %268 None 
                                                      OpBranch %269 
                                             %269 = OpLabel 
                                         i32 %270 = OpLoad %263 
                                        bool %271 = OpSLessThanEqual %270 %73 
                                                      OpBranchConditional %271 %266 %267 
                                             %266 = OpLabel 
                                         i32 %272 = OpLoad %263 
                                         f32 %273 = OpConvertSToF %272 
                                                      OpStore %188 %273 
                                         f32 %274 = OpLoad %188 
                                Uniform f32* %275 = OpAccessChain %40 %150 %65 
                                         f32 %276 = OpLoad %275 
                                         f32 %277 = OpFMul %274 %276 
                                Private f32* %278 = OpAccessChain %191 %65 
                                                      OpStore %278 %277 
                                                      OpStore %279 %73 
                                                      OpBranch %280 
                                             %280 = OpLabel 
                                                      OpLoopMerge %282 %283 None 
                                                      OpBranch %284 
                                             %284 = OpLabel 
                                         i32 %285 = OpLoad %168 
                                         i32 %286 = OpLoad %279 
                                        bool %287 = OpSGreaterThanEqual %285 %286 
                                                      OpBranchConditional %287 %281 %282 
                                             %281 = OpLabel 
                                         i32 %288 = OpLoad %279 
                                         f32 %289 = OpConvertSToF %288 
                                Private f32* %290 = OpAccessChain %207 %35 
                                                      OpStore %290 %289 
                                Private f32* %291 = OpAccessChain %207 %35 
                                         f32 %292 = OpLoad %291 
                                Uniform f32* %293 = OpAccessChain %40 %150 %35 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFMul %292 %294 
                                Private f32* %296 = OpAccessChain %191 %35 
                                                      OpStore %296 %295 
                                       f32_4 %297 = OpLoad %191 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                       f32_2 %299 = OpLoad vs_TEXCOORD1 
                                       f32_2 %300 = OpFAdd %298 %299 
                                                      OpStore %207 %300 
                         read_only Texture2D %301 = OpLoad %12 
                                     sampler %302 = OpLoad %29 
                  read_only Texture2DSampled %303 = OpSampledImage %301 %302 
                                       f32_2 %304 = OpLoad %207 
                                       f32_4 %305 = OpImageSampleExplicitLod %303 %304 Lod %7 
                                       f32_3 %306 = OpVectorShuffle %305 %305 0 1 2 
                                       f32_4 %307 = OpLoad %191 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 1 5 6 
                                                      OpStore %191 %308 
                              Private f32_4* %309 = OpAccessChain %138 %42 
                                       f32_4 %310 = OpLoad %309 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                                                      OpStore %230 %311 
                                       f32_4 %312 = OpLoad %191 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 2 3 
                                       f32_3 %314 = OpLoad %230 
                                       f32_3 %315 = OpFAdd %313 %314 
                                                      OpStore %230 %315 
                                       f32_3 %316 = OpLoad %230 
                              Private f32_4* %317 = OpAccessChain %138 %42 
                                       f32_4 %318 = OpLoad %317 
                                       f32_4 %319 = OpVectorShuffle %318 %316 4 5 6 3 
                                                      OpStore %317 %319 
                              Private f32_4* %320 = OpAccessChain %154 %42 
                                       f32_4 %321 = OpLoad %320 
                                       f32_3 %322 = OpVectorShuffle %321 %321 0 1 2 
                                                      OpStore %230 %322 
                                       f32_4 %323 = OpLoad %191 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 2 3 
                                       f32_4 %325 = OpLoad %191 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 2 3 
                                       f32_3 %327 = OpFMul %324 %326 
                                       f32_3 %328 = OpLoad %230 
                                       f32_3 %329 = OpFAdd %327 %328 
                                       f32_4 %330 = OpLoad %191 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 1 5 6 
                                                      OpStore %191 %331 
                                       f32_4 %332 = OpLoad %191 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 2 3 
                              Private f32_4* %334 = OpAccessChain %154 %42 
                                       f32_4 %335 = OpLoad %334 
                                       f32_4 %336 = OpVectorShuffle %335 %333 4 5 6 3 
                                                      OpStore %334 %336 
                                                      OpBranch %283 
                                             %283 = OpLabel 
                                         i32 %337 = OpLoad %279 
                                         i32 %338 = OpIAdd %337 %42 
                                                      OpStore %279 %338 
                                                      OpBranch %280 
                                             %282 = OpLabel 
                                                      OpBranch %268 
                                             %268 = OpLabel 
                                         i32 %339 = OpLoad %263 
                                         i32 %340 = OpIAdd %339 %42 
                                                      OpStore %263 %340 
                                                      OpBranch %265 
                                             %267 = OpLabel 
                                                      OpStore %341 %73 
                                                      OpBranch %342 
                                             %342 = OpLabel 
                                                      OpLoopMerge %344 %345 None 
                                                      OpBranch %346 
                                             %346 = OpLabel 
                                         i32 %347 = OpLoad %168 
                                         i32 %348 = OpLoad %341 
                                        bool %349 = OpSGreaterThanEqual %347 %348 
                                                      OpBranchConditional %349 %343 %344 
                                             %343 = OpLabel 
                                         i32 %350 = OpLoad %341 
                                         f32 %351 = OpConvertSToF %350 
                                                      OpStore %188 %351 
                                         f32 %352 = OpLoad %188 
                                Uniform f32* %353 = OpAccessChain %40 %150 %65 
                                         f32 %354 = OpLoad %353 
                                         f32 %355 = OpFMul %352 %354 
                                Private f32* %356 = OpAccessChain %191 %65 
                                                      OpStore %356 %355 
                                                      OpStore %357 %73 
                                                      OpBranch %358 
                                             %358 = OpLabel 
                                                      OpLoopMerge %360 %361 None 
                                                      OpBranch %362 
                                             %362 = OpLabel 
                                         i32 %363 = OpLoad %168 
                                         i32 %364 = OpLoad %357 
                                        bool %365 = OpSGreaterThanEqual %363 %364 
                                                      OpBranchConditional %365 %359 %360 
                                             %359 = OpLabel 
                                         i32 %366 = OpLoad %357 
                                         f32 %367 = OpConvertSToF %366 
                                Private f32* %368 = OpAccessChain %207 %35 
                                                      OpStore %368 %367 
                                Private f32* %369 = OpAccessChain %207 %35 
                                         f32 %370 = OpLoad %369 
                                Uniform f32* %371 = OpAccessChain %40 %150 %35 
                                         f32 %372 = OpLoad %371 
                                         f32 %373 = OpFMul %370 %372 
                                Private f32* %374 = OpAccessChain %191 %35 
                                                      OpStore %374 %373 
                                       f32_4 %375 = OpLoad %191 
                                       f32_2 %376 = OpVectorShuffle %375 %375 0 1 
                                       f32_2 %377 = OpLoad vs_TEXCOORD1 
                                       f32_2 %378 = OpFAdd %376 %377 
                                                      OpStore %207 %378 
                         read_only Texture2D %379 = OpLoad %12 
                                     sampler %380 = OpLoad %29 
                  read_only Texture2DSampled %381 = OpSampledImage %379 %380 
                                       f32_2 %382 = OpLoad %207 
                                       f32_4 %383 = OpImageSampleExplicitLod %381 %382 Lod %7 
                                       f32_3 %384 = OpVectorShuffle %383 %383 0 1 2 
                                       f32_4 %385 = OpLoad %191 
                                       f32_4 %386 = OpVectorShuffle %385 %384 4 1 5 6 
                                                      OpStore %191 %386 
                              Private f32_4* %387 = OpAccessChain %138 %51 
                                       f32_4 %388 = OpLoad %387 
                                       f32_3 %389 = OpVectorShuffle %388 %388 0 1 2 
                                                      OpStore %230 %389 
                                       f32_4 %390 = OpLoad %191 
                                       f32_3 %391 = OpVectorShuffle %390 %390 0 2 3 
                                       f32_3 %392 = OpLoad %230 
                                       f32_3 %393 = OpFAdd %391 %392 
                                                      OpStore %230 %393 
                                       f32_3 %394 = OpLoad %230 
                              Private f32_4* %395 = OpAccessChain %138 %51 
                                       f32_4 %396 = OpLoad %395 
                                       f32_4 %397 = OpVectorShuffle %396 %394 4 5 6 3 
                                                      OpStore %395 %397 
                              Private f32_4* %398 = OpAccessChain %154 %51 
                                       f32_4 %399 = OpLoad %398 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                                      OpStore %230 %400 
                                       f32_4 %401 = OpLoad %191 
                                       f32_3 %402 = OpVectorShuffle %401 %401 0 2 3 
                                       f32_4 %403 = OpLoad %191 
                                       f32_3 %404 = OpVectorShuffle %403 %403 0 2 3 
                                       f32_3 %405 = OpFMul %402 %404 
                                       f32_3 %406 = OpLoad %230 
                                       f32_3 %407 = OpFAdd %405 %406 
                                       f32_4 %408 = OpLoad %191 
                                       f32_4 %409 = OpVectorShuffle %408 %407 4 1 5 6 
                                                      OpStore %191 %409 
                                       f32_4 %410 = OpLoad %191 
                                       f32_3 %411 = OpVectorShuffle %410 %410 0 2 3 
                              Private f32_4* %412 = OpAccessChain %154 %51 
                                       f32_4 %413 = OpLoad %412 
                                       f32_4 %414 = OpVectorShuffle %413 %411 4 5 6 3 
                                                      OpStore %412 %414 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                         i32 %415 = OpLoad %357 
                                         i32 %416 = OpIAdd %415 %42 
                                                      OpStore %357 %416 
                                                      OpBranch %358 
                                             %360 = OpLabel 
                                                      OpBranch %345 
                                             %345 = OpLabel 
                                         i32 %417 = OpLoad %341 
                                         i32 %418 = OpIAdd %417 %42 
                                                      OpStore %341 %418 
                                                      OpBranch %342 
                                             %344 = OpLabel 
                                                      OpStore %419 %73 
                                                      OpBranch %420 
                                             %420 = OpLabel 
                                                      OpLoopMerge %422 %423 None 
                                                      OpBranch %424 
                                             %424 = OpLabel 
                                         i32 %425 = OpLoad %168 
                                         i32 %426 = OpLoad %419 
                                        bool %427 = OpSGreaterThanEqual %425 %426 
                                                      OpBranchConditional %427 %421 %422 
                                             %421 = OpLabel 
                                         i32 %428 = OpLoad %419 
                                         f32 %429 = OpConvertSToF %428 
                                                      OpStore %188 %429 
                                         f32 %430 = OpLoad %188 
                                Uniform f32* %431 = OpAccessChain %40 %150 %65 
                                         f32 %432 = OpLoad %431 
                                         f32 %433 = OpFMul %430 %432 
                                Private f32* %434 = OpAccessChain %191 %65 
                                                      OpStore %434 %433 
                                         i32 %436 = OpLoad %172 
                                                      OpStore %435 %436 
                                                      OpBranch %437 
                                             %437 = OpLabel 
                                                      OpLoopMerge %439 %440 None 
                                                      OpBranch %441 
                                             %441 = OpLabel 
                                         i32 %442 = OpLoad %435 
                                        bool %443 = OpSLessThanEqual %442 %73 
                                                      OpBranchConditional %443 %438 %439 
                                             %438 = OpLabel 
                                         i32 %444 = OpLoad %435 
                                         f32 %445 = OpConvertSToF %444 
                                Private f32* %446 = OpAccessChain %207 %35 
                                                      OpStore %446 %445 
                                Private f32* %447 = OpAccessChain %207 %35 
                                         f32 %448 = OpLoad %447 
                                Uniform f32* %449 = OpAccessChain %40 %150 %35 
                                         f32 %450 = OpLoad %449 
                                         f32 %451 = OpFMul %448 %450 
                                Private f32* %452 = OpAccessChain %191 %35 
                                                      OpStore %452 %451 
                                       f32_4 %453 = OpLoad %191 
                                       f32_2 %454 = OpVectorShuffle %453 %453 0 1 
                                       f32_2 %455 = OpLoad vs_TEXCOORD1 
                                       f32_2 %456 = OpFAdd %454 %455 
                                                      OpStore %207 %456 
                         read_only Texture2D %457 = OpLoad %12 
                                     sampler %458 = OpLoad %29 
                  read_only Texture2DSampled %459 = OpSampledImage %457 %458 
                                       f32_2 %460 = OpLoad %207 
                                       f32_4 %461 = OpImageSampleExplicitLod %459 %460 Lod %7 
                                       f32_3 %462 = OpVectorShuffle %461 %461 0 1 2 
                                       f32_4 %463 = OpLoad %191 
                                       f32_4 %464 = OpVectorShuffle %463 %462 4 1 5 6 
                                                      OpStore %191 %464 
                              Private f32_4* %465 = OpAccessChain %138 %150 
                                       f32_4 %466 = OpLoad %465 
                                       f32_3 %467 = OpVectorShuffle %466 %466 0 1 2 
                                                      OpStore %230 %467 
                                       f32_4 %468 = OpLoad %191 
                                       f32_3 %469 = OpVectorShuffle %468 %468 0 2 3 
                                       f32_3 %470 = OpLoad %230 
                                       f32_3 %471 = OpFAdd %469 %470 
                                                      OpStore %230 %471 
                                       f32_3 %472 = OpLoad %230 
                              Private f32_4* %473 = OpAccessChain %138 %150 
                                       f32_4 %474 = OpLoad %473 
                                       f32_4 %475 = OpVectorShuffle %474 %472 4 5 6 3 
                                                      OpStore %473 %475 
                              Private f32_4* %476 = OpAccessChain %154 %150 
                                       f32_4 %477 = OpLoad %476 
                                       f32_3 %478 = OpVectorShuffle %477 %477 0 1 2 
                                                      OpStore %230 %478 
                                       f32_4 %479 = OpLoad %191 
                                       f32_3 %480 = OpVectorShuffle %479 %479 0 2 3 
                                       f32_4 %481 = OpLoad %191 
                                       f32_3 %482 = OpVectorShuffle %481 %481 0 2 3 
                                       f32_3 %483 = OpFMul %480 %482 
                                       f32_3 %484 = OpLoad %230 
                                       f32_3 %485 = OpFAdd %483 %484 
                                       f32_4 %486 = OpLoad %191 
                                       f32_4 %487 = OpVectorShuffle %486 %485 4 1 5 6 
                                                      OpStore %191 %487 
                                       f32_4 %488 = OpLoad %191 
                                       f32_3 %489 = OpVectorShuffle %488 %488 0 2 3 
                              Private f32_4* %490 = OpAccessChain %154 %150 
                                       f32_4 %491 = OpLoad %490 
                                       f32_4 %492 = OpVectorShuffle %491 %489 4 5 6 3 
                                                      OpStore %490 %492 
                                                      OpBranch %440 
                                             %440 = OpLabel 
                                         i32 %493 = OpLoad %435 
                                         i32 %494 = OpIAdd %493 %42 
                                                      OpStore %435 %494 
                                                      OpBranch %437 
                                             %439 = OpLabel 
                                                      OpBranch %423 
                                             %423 = OpLabel 
                                         i32 %495 = OpLoad %419 
                                         i32 %496 = OpIAdd %495 %42 
                                                      OpStore %419 %496 
                                                      OpBranch %420 
                                             %422 = OpLabel 
                                       f32_4 %498 = OpLoad %9 
                                       f32_3 %499 = OpVectorShuffle %498 %498 0 1 2 
                                       f32_4 %500 = OpLoad %497 
                                       f32_4 %501 = OpVectorShuffle %500 %499 4 5 6 3 
                                                      OpStore %497 %501 
                                                      OpStore %502 %503 
                                                      OpStore %504 %73 
                                                      OpBranch %505 
                                             %505 = OpLabel 
                                                      OpLoopMerge %507 %508 None 
                                                      OpBranch %509 
                                             %509 = OpLabel 
                                         i32 %510 = OpLoad %504 
                                        bool %511 = OpSLessThan %510 %128 
                                                      OpBranchConditional %511 %506 %507 
                                             %506 = OpLabel 
                                         i32 %512 = OpLoad %504 
                              Private f32_4* %513 = OpAccessChain %138 %512 
                                       f32_4 %514 = OpLoad %513 
                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
                                       f32_4 %516 = OpLoad %191 
                                       f32_4 %517 = OpVectorShuffle %516 %515 4 5 6 3 
                                                      OpStore %191 %517 
                                       f32_4 %518 = OpLoad %191 
                                       f32_3 %519 = OpVectorShuffle %518 %518 0 1 2 
                                         f32 %520 = OpLoad %37 
                                       f32_3 %521 = OpCompositeConstruct %520 %520 %520 
                                       f32_3 %522 = OpFDiv %519 %521 
                                       f32_4 %523 = OpLoad %191 
                                       f32_4 %524 = OpVectorShuffle %523 %522 4 5 6 3 
                                                      OpStore %191 %524 
                                         i32 %525 = OpLoad %504 
                                       f32_4 %526 = OpLoad %191 
                                       f32_3 %527 = OpVectorShuffle %526 %526 0 1 2 
                              Private f32_4* %528 = OpAccessChain %138 %525 
                                       f32_4 %529 = OpLoad %528 
                                       f32_4 %530 = OpVectorShuffle %529 %527 4 5 6 3 
                                                      OpStore %528 %530 
                                         i32 %531 = OpLoad %504 
                              Private f32_4* %532 = OpAccessChain %154 %531 
                                       f32_4 %533 = OpLoad %532 
                                       f32_3 %534 = OpVectorShuffle %533 %533 0 1 2 
                                                      OpStore %230 %534 
                                       f32_3 %535 = OpLoad %230 
                                         f32 %536 = OpLoad %37 
                                       f32_3 %537 = OpCompositeConstruct %536 %536 %536 
                                       f32_3 %538 = OpFDiv %535 %537 
                                                      OpStore %230 %538 
                                       f32_4 %539 = OpLoad %191 
                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                                       f32_3 %541 = OpFNegate %540 
                                       f32_4 %542 = OpLoad %191 
                                       f32_3 %543 = OpVectorShuffle %542 %542 0 1 2 
                                       f32_3 %544 = OpFMul %541 %543 
                                       f32_3 %545 = OpLoad %230 
                                       f32_3 %546 = OpFAdd %544 %545 
                                                      OpStore %230 %546 
                                         i32 %547 = OpLoad %504 
                                       f32_3 %548 = OpLoad %230 
                                       f32_3 %549 = OpExtInst %1 4 %548 
                              Private f32_4* %550 = OpAccessChain %154 %547 
                                       f32_4 %551 = OpLoad %550 
                                       f32_4 %552 = OpVectorShuffle %551 %549 4 5 6 3 
                                                      OpStore %550 %552 
                                Private f32* %554 = OpAccessChain %230 %65 
                                         f32 %555 = OpLoad %554 
                                         f32 %556 = OpExtInst %1 4 %555 
                                Private f32* %557 = OpAccessChain %230 %35 
                                         f32 %558 = OpLoad %557 
                                         f32 %559 = OpExtInst %1 4 %558 
                                         f32 %560 = OpFAdd %556 %559 
                                                      OpStore %553 %560 
                                Private f32* %561 = OpAccessChain %230 %74 
                                         f32 %562 = OpLoad %561 
                                         f32 %563 = OpExtInst %1 4 %562 
                                         f32 %564 = OpLoad %553 
                                         f32 %565 = OpFAdd %563 %564 
                                                      OpStore %553 %565 
                                         f32 %568 = OpLoad %553 
                                         f32 %569 = OpLoad %502 
                                        bool %570 = OpFOrdLessThan %568 %569 
                                                      OpStore %567 %570 
                                        bool %571 = OpLoad %567 
                                                      OpSelectionMerge %573 None 
                                                      OpBranchConditional %571 %572 %573 
                                             %572 = OpLabel 
                                       f32_4 %574 = OpLoad %191 
                                       f32_3 %575 = OpVectorShuffle %574 %574 0 1 2 
                                       f32_4 %576 = OpLoad %497 
                                       f32_4 %577 = OpVectorShuffle %576 %575 4 5 6 3 
                                                      OpStore %497 %577 
                                         f32 %578 = OpLoad %553 
                                                      OpStore %502 %578 
                                                      OpBranch %573 
                                             %573 = OpLabel 
                                                      OpBranch %508 
                                             %508 = OpLabel 
                                         i32 %579 = OpLoad %504 
                                         i32 %580 = OpIAdd %579 %42 
                                                      OpStore %504 %580 
                                                      OpBranch %505 
                                             %507 = OpLabel 
                                Private f32* %581 = OpAccessChain %9 %43 
                                         f32 %582 = OpLoad %581 
                                Private f32* %583 = OpAccessChain %497 %43 
                                                      OpStore %583 %582 
                                       f32_4 %584 = OpLoad %9 
                                       f32_4 %585 = OpLoad %497 
                                       f32_4 %586 = OpFNegate %585 
                                       f32_4 %587 = OpFAdd %584 %586 
                                                      OpStore %9 %587 
                                         f32 %590 = OpLoad %26 
                                       f32_4 %591 = OpCompositeConstruct %590 %590 %590 %590 
                                       f32_4 %592 = OpLoad %9 
                                       f32_4 %593 = OpFMul %591 %592 
                                       f32_4 %594 = OpLoad %497 
                                       f32_4 %595 = OpFAdd %593 %594 
                                                      OpStore %589 %595 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
}