//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/SC Post Effects/Tilt Shift" {
Properties {
}
SubShader {
 Pass {
  Name "Tilt Shift: Horizontal"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 11494
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
vec2 ImmCB_0_0_0[12];
uniform 	vec4 _Params;
uniform 	float _Offset;
uniform 	float _Angle;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
int u_xlati6;
bool u_xlatb9;
void main()
{
	ImmCB_0_0_0[0] = vec2(-0.326211989, -0.405809999);
	ImmCB_0_0_0[1] = vec2(-0.840143979, -0.0735799968);
	ImmCB_0_0_0[2] = vec2(-0.69591397, 0.457136989);
	ImmCB_0_0_0[3] = vec2(-0.203345001, 0.620715976);
	ImmCB_0_0_0[4] = vec2(0.962339997, -0.194983006);
	ImmCB_0_0_0[5] = vec2(0.473434001, -0.480026007);
	ImmCB_0_0_0[6] = vec2(0.519456029, 0.767022014);
	ImmCB_0_0_0[7] = vec2(0.185461, -0.893123984);
	ImmCB_0_0_0[8] = vec2(0.507430971, 0.0644249991);
	ImmCB_0_0_0[9] = vec2(0.896420002, 0.412458003);
	ImmCB_0_0_0[10] = vec2(-0.321940005, -0.932614982);
	ImmCB_0_0_0[11] = vec2(-0.791558981, -0.597710013);
    u_xlat0.y = cos(_Angle);
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = sin((-_Angle));
    u_xlat0.x = dot(u_xlat6.xy, u_xlat0.xy);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x + (-_Offset);
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = u_xlat0.x + (-_Params.x);
    u_xlat3 = float(1.0) / _Params.y;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * 0.00999999978;
    u_xlat3 = u_xlat0.x * _Params.z;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
    {
        u_xlat2.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * vec2(u_xlat3) + vs_TEXCOORD1.xy;
        u_xlat2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    SV_Target0.w = u_xlat0.x;
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
; Bound: 237
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %26 %195 %220 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpMemberDecorate %11 1 Offset 11 
                                              OpMemberDecorate %11 2 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD0 Location 26 
                                              OpDecorate vs_TEXCOORD1 Location 195 
                                              OpDecorate %202 DescriptorSet 202 
                                              OpDecorate %202 Binding 202 
                                              OpDecorate %206 DescriptorSet 206 
                                              OpDecorate %206 Binding 206 
                                              OpDecorate %220 Location 220 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypeStruct %10 %6 %6 
                                      %12 = OpTypePointer Uniform %11 
   Uniform struct {f32_4; f32; f32;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 2 
                                      %16 = OpTypePointer Uniform %6 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 1 
                                      %22 = OpTypePointer Private %6 
                       Private f32_2* %24 = OpVariable Private 
                                      %25 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %28 = OpConstant 3.674022E-40 
                                f32_2 %29 = OpConstantComposite %28 %28 
                                  u32 %35 = OpConstant 0 
                                  f32 %43 = OpConstant 3.674022E-40 
                                  f32 %48 = OpConstant 3.674022E-40 
                                  f32 %49 = OpConstant 3.674022E-40 
                                  f32 %54 = OpConstant 3.674022E-40 
                                  f32 %56 = OpConstant 3.674022E-40 
                                  i32 %61 = OpConstant 1 
                                  i32 %74 = OpConstant 0 
                         Private f32* %80 = OpVariable Private 
                                  f32 %95 = OpConstant 3.674022E-40 
                                  f32 %97 = OpConstant 3.674022E-40 
                                 f32 %116 = OpConstant 3.674022E-40 
                                 u32 %121 = OpConstant 2 
                                     %125 = OpTypeVector %6 3 
                                     %126 = OpTypePointer Private %125 
                      Private f32_3* %127 = OpVariable Private 
                                     %131 = OpTypePointer Function %14 
                                 i32 %139 = OpConstant 12 
                                     %140 = OpTypeBool 
                      Private f32_3* %142 = OpVariable Private 
                                     %143 = OpTypeVector %20 4 
                                 u32 %144 = OpConstant 12 
                                     %145 = OpTypeArray %143 %144 
                                 u32 %146 = OpConstant 3198616898 
                                 u32 %147 = OpConstant 3201287764 
                               u32_4 %148 = OpConstantComposite %146 %147 %35 %35 
                                 u32 %149 = OpConstant 3210154925 
                                 u32 %150 = OpConstant 3180769564 
                               u32_4 %151 = OpConstantComposite %149 %150 %35 %35 
                                 u32 %152 = OpConstant 3207735147 
                                 u32 %153 = OpConstant 1055526364 
                               u32_4 %154 = OpConstantComposite %152 %153 %35 %35 
                                 u32 %155 = OpConstant 3192928684 
                                 u32 %156 = OpConstant 1058989886 
                               u32_4 %157 = OpConstantComposite %155 %156 %35 %35 
                                 u32 %158 = OpConstant 1064721386 
                                 u32 %159 = OpConstant 3192367520 
                               u32_4 %160 = OpConstantComposite %158 %159 %35 %35 
                                 u32 %161 = OpConstant 1056073201 
                                 u32 %162 = OpConstant 3203778040 
                               u32_4 %163 = OpConstantComposite %161 %162 %35 %35 
                                 u32 %164 = OpConstant 1057291026 
                                 u32 %165 = OpConstant 1061444494 
                               u32_4 %166 = OpConstantComposite %164 %165 %35 %35 
                                 u32 %167 = OpConstant 1044244861 
                                 u32 %168 = OpConstant 3211043782 
                               u32_4 %169 = OpConstantComposite %167 %168 %35 %35 
                                 u32 %170 = OpConstant 1057089279 
                                 u32 %171 = OpConstant 1032057153 
                               u32_4 %172 = OpConstantComposite %170 %171 %35 %35 
                                 u32 %173 = OpConstant 1063615432 
                                 u32 %174 = OpConstant 1054027186 
                               u32_4 %175 = OpConstantComposite %173 %174 %35 %35 
                                 u32 %176 = OpConstant 3198473554 
                                 u32 %177 = OpConstant 3211706331 
                               u32_4 %178 = OpConstantComposite %176 %177 %35 %35 
                                 u32 %179 = OpConstant 3209339804 
                                 u32 %180 = OpConstant 3206087558 
                               u32_4 %181 = OpConstantComposite %179 %180 %35 %35 
                           u32_4[12] %182 = OpConstantComposite %148 %151 %154 %157 %160 %163 %166 %169 %172 %175 %178 %181 
                                     %184 = OpTypeVector %20 2 
                                     %185 = OpTypePointer Function %145 
                                     %187 = OpTypePointer Function %143 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %200 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %201 = OpTypePointer UniformConstant %200 
UniformConstant read_only Texture2D* %202 = OpVariable UniformConstant 
                                     %204 = OpTypeSampler 
                                     %205 = OpTypePointer UniformConstant %204 
            UniformConstant sampler* %206 = OpVariable UniformConstant 
                                     %208 = OpTypeSampledImage %200 
                                     %219 = OpTypePointer Output %10 
                       Output f32_4* %220 = OpVariable Output 
                                 f32 %222 = OpConstant 3.674022E-40 
                               f32_3 %223 = OpConstantComposite %222 %222 %222 
                                 u32 %229 = OpConstant 3 
                                     %230 = OpTypePointer Output %6 
                                     %233 = OpTypePointer Private %14 
                        Private i32* %234 = OpVariable Private 
                                     %235 = OpTypePointer Private %140 
                       Private bool* %236 = OpVariable Private 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function i32* %132 = OpVariable Function 
                 Function u32_4[12]* %186 = OpVariable Function 
                         Uniform f32* %17 = OpAccessChain %13 %15 
                                  f32 %18 = OpLoad %17 
                                  f32 %19 = OpExtInst %1 14 %18 
                         Private f32* %23 = OpAccessChain %9 %21 
                                              OpStore %23 %19 
                                f32_2 %27 = OpLoad vs_TEXCOORD0 
                                f32_2 %30 = OpFAdd %27 %29 
                                              OpStore %24 %30 
                         Uniform f32* %31 = OpAccessChain %13 %15 
                                  f32 %32 = OpLoad %31 
                                  f32 %33 = OpFNegate %32 
                                  f32 %34 = OpExtInst %1 13 %33 
                         Private f32* %36 = OpAccessChain %9 %35 
                                              OpStore %36 %34 
                                f32_2 %37 = OpLoad %24 
                                f32_2 %38 = OpLoad %9 
                                  f32 %39 = OpDot %37 %38 
                         Private f32* %40 = OpAccessChain %9 %35 
                                              OpStore %40 %39 
                         Private f32* %41 = OpAccessChain %9 %35 
                                  f32 %42 = OpLoad %41 
                                  f32 %44 = OpFAdd %42 %43 
                         Private f32* %45 = OpAccessChain %9 %35 
                                              OpStore %45 %44 
                         Private f32* %46 = OpAccessChain %9 %35 
                                  f32 %47 = OpLoad %46 
                                  f32 %50 = OpExtInst %1 43 %47 %48 %49 
                         Private f32* %51 = OpAccessChain %9 %35 
                                              OpStore %51 %50 
                         Private f32* %52 = OpAccessChain %9 %35 
                                  f32 %53 = OpLoad %52 
                                  f32 %55 = OpFMul %53 %54 
                                  f32 %57 = OpFAdd %55 %56 
                         Private f32* %58 = OpAccessChain %9 %35 
                                              OpStore %58 %57 
                         Private f32* %59 = OpAccessChain %9 %35 
                                  f32 %60 = OpLoad %59 
                         Uniform f32* %62 = OpAccessChain %13 %61 
                                  f32 %63 = OpLoad %62 
                                  f32 %64 = OpFNegate %63 
                                  f32 %65 = OpFAdd %60 %64 
                         Private f32* %66 = OpAccessChain %9 %35 
                                              OpStore %66 %65 
                         Private f32* %67 = OpAccessChain %9 %35 
                                  f32 %68 = OpLoad %67 
                                  f32 %69 = OpExtInst %1 4 %68 
                                  f32 %70 = OpExtInst %1 37 %69 %49 
                         Private f32* %71 = OpAccessChain %9 %35 
                                              OpStore %71 %70 
                         Private f32* %72 = OpAccessChain %9 %35 
                                  f32 %73 = OpLoad %72 
                         Uniform f32* %75 = OpAccessChain %13 %74 %35 
                                  f32 %76 = OpLoad %75 
                                  f32 %77 = OpFNegate %76 
                                  f32 %78 = OpFAdd %73 %77 
                         Private f32* %79 = OpAccessChain %9 %35 
                                              OpStore %79 %78 
                         Uniform f32* %81 = OpAccessChain %13 %74 %21 
                                  f32 %82 = OpLoad %81 
                                  f32 %83 = OpFDiv %49 %82 
                                              OpStore %80 %83 
                                  f32 %84 = OpLoad %80 
                         Private f32* %85 = OpAccessChain %9 %35 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpFMul %84 %86 
                         Private f32* %88 = OpAccessChain %9 %35 
                                              OpStore %88 %87 
                         Private f32* %89 = OpAccessChain %9 %35 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpExtInst %1 43 %90 %48 %49 
                         Private f32* %92 = OpAccessChain %9 %35 
                                              OpStore %92 %91 
                         Private f32* %93 = OpAccessChain %9 %35 
                                  f32 %94 = OpLoad %93 
                                  f32 %96 = OpFMul %94 %95 
                                  f32 %98 = OpFAdd %96 %97 
                                              OpStore %80 %98 
                         Private f32* %99 = OpAccessChain %9 %35 
                                 f32 %100 = OpLoad %99 
                        Private f32* %101 = OpAccessChain %9 %35 
                                 f32 %102 = OpLoad %101 
                                 f32 %103 = OpFMul %100 %102 
                        Private f32* %104 = OpAccessChain %9 %35 
                                              OpStore %104 %103 
                        Private f32* %105 = OpAccessChain %9 %35 
                                 f32 %106 = OpLoad %105 
                                 f32 %107 = OpLoad %80 
                                 f32 %108 = OpFMul %106 %107 
                        Private f32* %109 = OpAccessChain %9 %35 
                                              OpStore %109 %108 
                        Private f32* %110 = OpAccessChain %9 %35 
                                 f32 %111 = OpLoad %110 
                                 f32 %112 = OpExtInst %1 37 %111 %49 
                        Private f32* %113 = OpAccessChain %9 %35 
                                              OpStore %113 %112 
                        Private f32* %114 = OpAccessChain %9 %35 
                                 f32 %115 = OpLoad %114 
                                 f32 %117 = OpFMul %115 %116 
                        Private f32* %118 = OpAccessChain %9 %35 
                                              OpStore %118 %117 
                        Private f32* %119 = OpAccessChain %9 %35 
                                 f32 %120 = OpLoad %119 
                        Uniform f32* %122 = OpAccessChain %13 %74 %121 
                                 f32 %123 = OpLoad %122 
                                 f32 %124 = OpFMul %120 %123 
                                              OpStore %80 %124 
                        Private f32* %128 = OpAccessChain %127 %35 
                                              OpStore %128 %48 
                        Private f32* %129 = OpAccessChain %127 %21 
                                              OpStore %129 %48 
                        Private f32* %130 = OpAccessChain %127 %121 
                                              OpStore %130 %48 
                                              OpStore %132 %74 
                                              OpBranch %133 
                                     %133 = OpLabel 
                                              OpLoopMerge %135 %136 None 
                                              OpBranch %137 
                                     %137 = OpLabel 
                                 i32 %138 = OpLoad %132 
                                bool %141 = OpSLessThan %138 %139 
                                              OpBranchConditional %141 %134 %135 
                                     %134 = OpLabel 
                                 i32 %183 = OpLoad %132 
                                              OpStore %186 %182 
                     Function u32_4* %188 = OpAccessChain %186 %183 
                               u32_4 %189 = OpLoad %188 
                               u32_2 %190 = OpVectorShuffle %189 %189 0 1 
                               f32_2 %191 = OpBitcast %190 
                                 f32 %192 = OpLoad %80 
                               f32_2 %193 = OpCompositeConstruct %192 %192 
                               f32_2 %194 = OpFMul %191 %193 
                               f32_2 %196 = OpLoad vs_TEXCOORD1 
                               f32_2 %197 = OpFAdd %194 %196 
                               f32_3 %198 = OpLoad %142 
                               f32_3 %199 = OpVectorShuffle %198 %197 3 4 2 
                                              OpStore %142 %199 
                 read_only Texture2D %203 = OpLoad %202 
                             sampler %207 = OpLoad %206 
          read_only Texture2DSampled %209 = OpSampledImage %203 %207 
                               f32_3 %210 = OpLoad %142 
                               f32_2 %211 = OpVectorShuffle %210 %210 0 1 
                               f32_4 %212 = OpImageSampleImplicitLod %209 %211 
                               f32_3 %213 = OpVectorShuffle %212 %212 0 1 2 
                                              OpStore %142 %213 
                               f32_3 %214 = OpLoad %127 
                               f32_3 %215 = OpLoad %142 
                               f32_3 %216 = OpFAdd %214 %215 
                                              OpStore %127 %216 
                                              OpBranch %136 
                                     %136 = OpLabel 
                                 i32 %217 = OpLoad %132 
                                 i32 %218 = OpIAdd %217 %61 
                                              OpStore %132 %218 
                                              OpBranch %133 
                                     %135 = OpLabel 
                               f32_3 %221 = OpLoad %127 
                               f32_3 %224 = OpFMul %221 %223 
                               f32_4 %225 = OpLoad %220 
                               f32_4 %226 = OpVectorShuffle %225 %224 4 5 6 3 
                                              OpStore %220 %226 
                        Private f32* %227 = OpAccessChain %9 %35 
                                 f32 %228 = OpLoad %227 
                         Output f32* %231 = OpAccessChain %220 %229 
                                              OpStore %231 %228 
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
  Name "Tilt Shift: Horizontal (HQ)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 117026
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
vec2 ImmCB_0_0_0[28];
uniform 	vec4 _Params;
uniform 	float _Offset;
uniform 	float _Angle;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
vec2 u_xlat6;
int u_xlati6;
bool u_xlatb9;
void main()
{
	ImmCB_0_0_0[0] = vec2(0.624629974, 0.543370008);
	ImmCB_0_0_0[1] = vec2(-0.13414, -0.944880009);
	ImmCB_0_0_0[2] = vec2(0.387719989, -0.434749991);
	ImmCB_0_0_0[3] = vec2(0.121260002, -0.192819998);
	ImmCB_0_0_0[4] = vec2(-0.203879997, 0.111330003);
	ImmCB_0_0_0[5] = vec2(0.831139982, -0.292180002);
	ImmCB_0_0_0[6] = vec2(0.107589997, -0.578390002);
	ImmCB_0_0_0[7] = vec2(0.282849997, 0.790359974);
	ImmCB_0_0_0[8] = vec2(-0.366219997, 0.39515999);
	ImmCB_0_0_0[9] = vec2(0.755909979, 0.219160005);
	ImmCB_0_0_0[10] = vec2(-0.52609998, 0.0238600001);
	ImmCB_0_0_0[11] = vec2(-0.882160008, -0.244709998);
	ImmCB_0_0_0[12] = vec2(-0.488880008, -0.293300003);
	ImmCB_0_0_0[13] = vec2(0.440140009, -0.0855799988);
	ImmCB_0_0_0[14] = vec2(0.211789995, 0.51372999);
	ImmCB_0_0_0[15] = vec2(0.0548299998, 0.957009971);
	ImmCB_0_0_0[16] = vec2(-0.590009987, -0.705089986);
	ImmCB_0_0_0[17] = vec2(-0.800650001, 0.246309996);
	ImmCB_0_0_0[18] = vec2(-0.194240004, -0.184019998);
	ImmCB_0_0_0[19] = vec2(-0.436670005, 0.767509997);
	ImmCB_0_0_0[20] = vec2(0.216659993, 0.116020001);
	ImmCB_0_0_0[21] = vec2(0.156959996, -0.856000006);
	ImmCB_0_0_0[22] = vec2(-0.758210003, 0.583630025);
	ImmCB_0_0_0[23] = vec2(0.992839992, -0.0290399995);
	ImmCB_0_0_0[24] = vec2(-0.222340003, -0.579069972);
	ImmCB_0_0_0[25] = vec2(0.550520003, -0.669839978);
	ImmCB_0_0_0[26] = vec2(0.46430999, 0.281150013);
	ImmCB_0_0_0[27] = vec2(-0.0721400008, 0.605539978);
    u_xlat0.y = cos(_Angle);
    u_xlat6.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = sin((-_Angle));
    u_xlat0.x = dot(u_xlat6.xy, u_xlat0.xy);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x + (-_Offset);
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = u_xlat0.x + (-_Params.x);
    u_xlat3 = float(1.0) / _Params.y;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * 0.00999999978;
    u_xlat3 = u_xlat0.x * _Params.z;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
    {
        u_xlat2.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * vec2(u_xlat3) + vs_TEXCOORD1.xy;
        u_xlat2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0357142873, 0.0357142873, 0.0357142873);
    SV_Target0.w = u_xlat0.x;
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
; Bound: 313
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %26 %271 %296 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpMemberDecorate %11 0 Offset 11 
                                              OpMemberDecorate %11 1 Offset 11 
                                              OpMemberDecorate %11 2 Offset 11 
                                              OpDecorate %11 Block 
                                              OpDecorate %13 DescriptorSet 13 
                                              OpDecorate %13 Binding 13 
                                              OpDecorate vs_TEXCOORD0 Location 26 
                                              OpDecorate vs_TEXCOORD1 Location 271 
                                              OpDecorate %278 DescriptorSet 278 
                                              OpDecorate %278 Binding 278 
                                              OpDecorate %282 DescriptorSet 282 
                                              OpDecorate %282 Binding 282 
                                              OpDecorate %296 Location 296 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypeVector %6 4 
                                      %11 = OpTypeStruct %10 %6 %6 
                                      %12 = OpTypePointer Uniform %11 
   Uniform struct {f32_4; f32; f32;}* %13 = OpVariable Uniform 
                                      %14 = OpTypeInt 32 1 
                                  i32 %15 = OpConstant 2 
                                      %16 = OpTypePointer Uniform %6 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 1 
                                      %22 = OpTypePointer Private %6 
                       Private f32_2* %24 = OpVariable Private 
                                      %25 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %28 = OpConstant 3.674022E-40 
                                f32_2 %29 = OpConstantComposite %28 %28 
                                  u32 %35 = OpConstant 0 
                                  f32 %43 = OpConstant 3.674022E-40 
                                  f32 %48 = OpConstant 3.674022E-40 
                                  f32 %49 = OpConstant 3.674022E-40 
                                  f32 %54 = OpConstant 3.674022E-40 
                                  f32 %56 = OpConstant 3.674022E-40 
                                  i32 %61 = OpConstant 1 
                                  i32 %74 = OpConstant 0 
                         Private f32* %80 = OpVariable Private 
                                  f32 %95 = OpConstant 3.674022E-40 
                                  f32 %97 = OpConstant 3.674022E-40 
                                 f32 %116 = OpConstant 3.674022E-40 
                                 u32 %121 = OpConstant 2 
                                     %125 = OpTypeVector %6 3 
                                     %126 = OpTypePointer Private %125 
                      Private f32_3* %127 = OpVariable Private 
                                     %131 = OpTypePointer Function %14 
                                 i32 %139 = OpConstant 28 
                                     %140 = OpTypeBool 
                      Private f32_3* %142 = OpVariable Private 
                                     %143 = OpTypeVector %20 4 
                                 u32 %144 = OpConstant 28 
                                     %145 = OpTypeArray %143 %144 
                                 u32 %146 = OpConstant 1059055552 
                                 u32 %147 = OpConstant 1057692236 
                                 u32 %148 = OpConstant 1062465857 
                               u32_4 %149 = OpConstantComposite %146 %147 %148 %35 
                                 u32 %150 = OpConstant 3188284415 
                                 u32 %151 = OpConstant 3211912104 
                                 u32 %152 = OpConstant 1064587336 
                               u32_4 %153 = OpConstantComposite %150 %151 %152 %35 
                                 u32 %154 = OpConstant 1053197116 
                                 u32 %155 = OpConstant 3202258829 
                                 u32 %156 = OpConstant 1058349232 
                               u32_4 %157 = OpConstantComposite %154 %155 %156 %35 
                                 u32 %158 = OpConstant 1039685418 
                                 u32 %159 = OpConstant 3192222363 
                                 u32 %160 = OpConstant 1047084841 
                               u32_4 %161 = OpConstantComposite %158 %159 %160 %35 
                                 u32 %162 = OpConstant 3192964587 
                                 u32 %163 = OpConstant 1038352636 
                                 u32 %164 = OpConstant 1047388173 
                               u32_4 %165 = OpConstantComposite %162 %163 %164 %35 
                                 u32 %166 = OpConstant 1062520215 
                                 u32 %167 = OpConstant 3197474974 
                                 u32 %168 = OpConstant 1063356727 
                               u32_4 %169 = OpConstantComposite %166 %167 %168 %35 
                                 u32 %170 = OpConstant 1037850661 
                                 u32 %171 = OpConstant 3205763422 
                                 u32 %172 = OpConstant 1058446204 
                               u32_4 %173 = OpConstantComposite %170 %171 %172 %35 
                                 u32 %174 = OpConstant 1049678263 
                                 u32 %175 = OpConstant 1061836040 
                                 u32 %176 = OpConstant 1062659634 
                               u32_4 %177 = OpConstantComposite %174 %175 %176 %35 
                                 u32 %178 = OpConstant 3199959344 
                                 u32 %179 = OpConstant 1053446761 
                                 u32 %180 = OpConstant 1057614893 
                               u32_4 %181 = OpConstantComposite %178 %179 %180 %35 
                                 u32 %182 = OpConstant 1061258065 
                                 u32 %183 = OpConstant 1046506363 
                                 u32 %184 = OpConstant 1061780340 
                               u32_4 %185 = OpConstantComposite %182 %183 %184 %35 
                                 u32 %186 = OpConstant 3204886141 
                                 u32 %187 = OpConstant 1019442700 
                                 u32 %188 = OpConstant 1057411553 
                               u32_4 %189 = OpConstantComposite %186 %187 %188 %35 
                                 u32 %190 = OpConstant 3210859837 
                                 u32 %191 = OpConstant 3195704642 
                                 u32 %192 = OpConstant 1063935038 
                               u32_4 %193 = OpConstantComposite %190 %191 %192 %35 
                                 u32 %194 = OpConstant 3204075131 
                                 u32 %195 = OpConstant 3197512555 
                                 u32 %196 = OpConstant 1058140859 
                               u32_4 %197 = OpConstantComposite %194 %195 %196 %35 
                                 u32 %198 = OpConstant 1054956040 
                                 u32 %199 = OpConstant 3182380177 
                                 u32 %200 = OpConstant 1055232528 
                               u32_4 %201 = OpConstantComposite %198 %199 %200 %35 
                                 u32 %202 = OpConstant 1046011770 
                                 u32 %203 = OpConstant 1057194959 
                                 u32 %204 = OpConstant 1057898596 
                               u32_4 %205 = OpConstantComposite %202 %203 %204 %35 
                                 u32 %206 = OpConstant 1029739884 
                                 u32 %207 = OpConstant 1064631963 
                                 u32 %208 = OpConstant 1064658304 
                               u32_4 %209 = OpConstantComposite %206 %207 %208 %35 
                                 u32 %210 = OpConstant 3205958373 
                                 u32 %211 = OpConstant 3207889095 
                                 u32 %212 = OpConstant 1064000637 
                               u32_4 %213 = OpConstantComposite %210 %211 %212 %35 
                                 u32 %214 = OpConstant 3209492326 
                                 u32 %215 = OpConstant 1048328368 
                                 u32 %216 = OpConstant 1062629938 
                               u32_4 %217 = OpConstantComposite %214 %215 %216 %35 
                                 u32 %218 = OpConstant 3192317658 
                                 u32 %219 = OpConstant 3191631805 
                                 u32 %220 = OpConstant 1049165551 
                               u32_4 %221 = OpConstantComposite %218 %219 %220 %35 
                                 u32 %222 = OpConstant 3202323254 
                                 u32 %223 = OpConstant 1061452681 
                                 u32 %224 = OpConstant 1063390953 
                               u32_4 %225 = OpConstantComposite %222 %223 %224 %35 
                                 u32 %226 = OpConstant 1046338590 
                                 u32 %227 = OpConstant 1038982117 
                                 u32 %228 = OpConstant 1048292130 
                               u32_4 %229 = OpConstantComposite %226 %227 %228 %35 
                                 u32 %230 = OpConstant 1042332191 
                                 u32 %231 = OpConstant 3210420945 
                                 u32 %232 = OpConstant 1063176708 
                               u32_4 %233 = OpConstantComposite %230 %231 %232 %35 
                                 u32 %234 = OpConstant 3208780301 
                                 u32 %235 = OpConstant 1058367687 
                                 u32 %236 = OpConstant 1064628776 
                               u32_4 %237 = OpConstantComposite %234 %235 %236 %35 
                                 u32 %238 = OpConstant 1065233091 
                                 u32 %239 = OpConstant 3169707339 
                                 u32 %240 = OpConstant 1065240305 
                               u32_4 %241 = OpConstantComposite %238 %239 %240 %35 
                                 u32 %242 = OpConstant 3194203417 
                                 u32 %243 = OpConstant 3205774830 
                                 u32 %244 = OpConstant 1058982739 
                               u32_4 %245 = OpConstantComposite %242 %243 %244 %35 
                                 u32 %246 = OpConstant 1057812193 
                                 u32 %247 = OpConstant 3207297698 
                                 u32 %248 = OpConstant 1063122517 
                               u32_4 %249 = OpConstantComposite %246 %247 %248 %35 
                                 u32 %250 = OpConstant 1055767050 
                                 u32 %251 = OpConstant 1049621221 
                                 u32 %252 = OpConstant 1057682673 
                               u32_4 %253 = OpConstantComposite %250 %251 %252 %35 
                                 u32 %254 = OpConstant 3180576291 
                                 u32 %255 = OpConstant 1058735275 
                                 u32 %256 = OpConstant 1058807082 
                               u32_4 %257 = OpConstantComposite %254 %255 %256 %35 
                           u32_4[28] %258 = OpConstantComposite %149 %153 %157 %161 %165 %169 %173 %177 %181 %185 %189 %193 %197 %201 %205 %209 %213 %217 %221 %225 %229 %233 %237 %241 %245 %249 %253 %257 
                                     %260 = OpTypeVector %20 2 
                                     %261 = OpTypePointer Function %145 
                                     %263 = OpTypePointer Function %143 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %276 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %277 = OpTypePointer UniformConstant %276 
UniformConstant read_only Texture2D* %278 = OpVariable UniformConstant 
                                     %280 = OpTypeSampler 
                                     %281 = OpTypePointer UniformConstant %280 
            UniformConstant sampler* %282 = OpVariable UniformConstant 
                                     %284 = OpTypeSampledImage %276 
                                     %295 = OpTypePointer Output %10 
                       Output f32_4* %296 = OpVariable Output 
                                 f32 %298 = OpConstant 3.674022E-40 
                               f32_3 %299 = OpConstantComposite %298 %298 %298 
                                 u32 %305 = OpConstant 3 
                                     %306 = OpTypePointer Output %6 
                                     %309 = OpTypePointer Private %14 
                        Private i32* %310 = OpVariable Private 
                                     %311 = OpTypePointer Private %140 
                       Private bool* %312 = OpVariable Private 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function i32* %132 = OpVariable Function 
                 Function u32_4[28]* %262 = OpVariable Function 
                         Uniform f32* %17 = OpAccessChain %13 %15 
                                  f32 %18 = OpLoad %17 
                                  f32 %19 = OpExtInst %1 14 %18 
                         Private f32* %23 = OpAccessChain %9 %21 
                                              OpStore %23 %19 
                                f32_2 %27 = OpLoad vs_TEXCOORD0 
                                f32_2 %30 = OpFAdd %27 %29 
                                              OpStore %24 %30 
                         Uniform f32* %31 = OpAccessChain %13 %15 
                                  f32 %32 = OpLoad %31 
                                  f32 %33 = OpFNegate %32 
                                  f32 %34 = OpExtInst %1 13 %33 
                         Private f32* %36 = OpAccessChain %9 %35 
                                              OpStore %36 %34 
                                f32_2 %37 = OpLoad %24 
                                f32_2 %38 = OpLoad %9 
                                  f32 %39 = OpDot %37 %38 
                         Private f32* %40 = OpAccessChain %9 %35 
                                              OpStore %40 %39 
                         Private f32* %41 = OpAccessChain %9 %35 
                                  f32 %42 = OpLoad %41 
                                  f32 %44 = OpFAdd %42 %43 
                         Private f32* %45 = OpAccessChain %9 %35 
                                              OpStore %45 %44 
                         Private f32* %46 = OpAccessChain %9 %35 
                                  f32 %47 = OpLoad %46 
                                  f32 %50 = OpExtInst %1 43 %47 %48 %49 
                         Private f32* %51 = OpAccessChain %9 %35 
                                              OpStore %51 %50 
                         Private f32* %52 = OpAccessChain %9 %35 
                                  f32 %53 = OpLoad %52 
                                  f32 %55 = OpFMul %53 %54 
                                  f32 %57 = OpFAdd %55 %56 
                         Private f32* %58 = OpAccessChain %9 %35 
                                              OpStore %58 %57 
                         Private f32* %59 = OpAccessChain %9 %35 
                                  f32 %60 = OpLoad %59 
                         Uniform f32* %62 = OpAccessChain %13 %61 
                                  f32 %63 = OpLoad %62 
                                  f32 %64 = OpFNegate %63 
                                  f32 %65 = OpFAdd %60 %64 
                         Private f32* %66 = OpAccessChain %9 %35 
                                              OpStore %66 %65 
                         Private f32* %67 = OpAccessChain %9 %35 
                                  f32 %68 = OpLoad %67 
                                  f32 %69 = OpExtInst %1 4 %68 
                                  f32 %70 = OpExtInst %1 37 %69 %49 
                         Private f32* %71 = OpAccessChain %9 %35 
                                              OpStore %71 %70 
                         Private f32* %72 = OpAccessChain %9 %35 
                                  f32 %73 = OpLoad %72 
                         Uniform f32* %75 = OpAccessChain %13 %74 %35 
                                  f32 %76 = OpLoad %75 
                                  f32 %77 = OpFNegate %76 
                                  f32 %78 = OpFAdd %73 %77 
                         Private f32* %79 = OpAccessChain %9 %35 
                                              OpStore %79 %78 
                         Uniform f32* %81 = OpAccessChain %13 %74 %21 
                                  f32 %82 = OpLoad %81 
                                  f32 %83 = OpFDiv %49 %82 
                                              OpStore %80 %83 
                                  f32 %84 = OpLoad %80 
                         Private f32* %85 = OpAccessChain %9 %35 
                                  f32 %86 = OpLoad %85 
                                  f32 %87 = OpFMul %84 %86 
                         Private f32* %88 = OpAccessChain %9 %35 
                                              OpStore %88 %87 
                         Private f32* %89 = OpAccessChain %9 %35 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpExtInst %1 43 %90 %48 %49 
                         Private f32* %92 = OpAccessChain %9 %35 
                                              OpStore %92 %91 
                         Private f32* %93 = OpAccessChain %9 %35 
                                  f32 %94 = OpLoad %93 
                                  f32 %96 = OpFMul %94 %95 
                                  f32 %98 = OpFAdd %96 %97 
                                              OpStore %80 %98 
                         Private f32* %99 = OpAccessChain %9 %35 
                                 f32 %100 = OpLoad %99 
                        Private f32* %101 = OpAccessChain %9 %35 
                                 f32 %102 = OpLoad %101 
                                 f32 %103 = OpFMul %100 %102 
                        Private f32* %104 = OpAccessChain %9 %35 
                                              OpStore %104 %103 
                        Private f32* %105 = OpAccessChain %9 %35 
                                 f32 %106 = OpLoad %105 
                                 f32 %107 = OpLoad %80 
                                 f32 %108 = OpFMul %106 %107 
                        Private f32* %109 = OpAccessChain %9 %35 
                                              OpStore %109 %108 
                        Private f32* %110 = OpAccessChain %9 %35 
                                 f32 %111 = OpLoad %110 
                                 f32 %112 = OpExtInst %1 37 %111 %49 
                        Private f32* %113 = OpAccessChain %9 %35 
                                              OpStore %113 %112 
                        Private f32* %114 = OpAccessChain %9 %35 
                                 f32 %115 = OpLoad %114 
                                 f32 %117 = OpFMul %115 %116 
                        Private f32* %118 = OpAccessChain %9 %35 
                                              OpStore %118 %117 
                        Private f32* %119 = OpAccessChain %9 %35 
                                 f32 %120 = OpLoad %119 
                        Uniform f32* %122 = OpAccessChain %13 %74 %121 
                                 f32 %123 = OpLoad %122 
                                 f32 %124 = OpFMul %120 %123 
                                              OpStore %80 %124 
                        Private f32* %128 = OpAccessChain %127 %35 
                                              OpStore %128 %48 
                        Private f32* %129 = OpAccessChain %127 %21 
                                              OpStore %129 %48 
                        Private f32* %130 = OpAccessChain %127 %121 
                                              OpStore %130 %48 
                                              OpStore %132 %74 
                                              OpBranch %133 
                                     %133 = OpLabel 
                                              OpLoopMerge %135 %136 None 
                                              OpBranch %137 
                                     %137 = OpLabel 
                                 i32 %138 = OpLoad %132 
                                bool %141 = OpSLessThan %138 %139 
                                              OpBranchConditional %141 %134 %135 
                                     %134 = OpLabel 
                                 i32 %259 = OpLoad %132 
                                              OpStore %262 %258 
                     Function u32_4* %264 = OpAccessChain %262 %259 
                               u32_4 %265 = OpLoad %264 
                               u32_2 %266 = OpVectorShuffle %265 %265 0 1 
                               f32_2 %267 = OpBitcast %266 
                                 f32 %268 = OpLoad %80 
                               f32_2 %269 = OpCompositeConstruct %268 %268 
                               f32_2 %270 = OpFMul %267 %269 
                               f32_2 %272 = OpLoad vs_TEXCOORD1 
                               f32_2 %273 = OpFAdd %270 %272 
                               f32_3 %274 = OpLoad %142 
                               f32_3 %275 = OpVectorShuffle %274 %273 3 4 2 
                                              OpStore %142 %275 
                 read_only Texture2D %279 = OpLoad %278 
                             sampler %283 = OpLoad %282 
          read_only Texture2DSampled %285 = OpSampledImage %279 %283 
                               f32_3 %286 = OpLoad %142 
                               f32_2 %287 = OpVectorShuffle %286 %286 0 1 
                               f32_4 %288 = OpImageSampleImplicitLod %285 %287 
                               f32_3 %289 = OpVectorShuffle %288 %288 0 1 2 
                                              OpStore %142 %289 
                               f32_3 %290 = OpLoad %127 
                               f32_3 %291 = OpLoad %142 
                               f32_3 %292 = OpFAdd %290 %291 
                                              OpStore %127 %292 
                                              OpBranch %136 
                                     %136 = OpLabel 
                                 i32 %293 = OpLoad %132 
                                 i32 %294 = OpIAdd %293 %61 
                                              OpStore %132 %294 
                                              OpBranch %133 
                                     %135 = OpLabel 
                               f32_3 %297 = OpLoad %127 
                               f32_3 %300 = OpFMul %297 %299 
                               f32_4 %301 = OpLoad %296 
                               f32_4 %302 = OpVectorShuffle %301 %300 4 5 6 3 
                                              OpStore %296 %302 
                        Private f32* %303 = OpAccessChain %9 %35 
                                 f32 %304 = OpLoad %303 
                         Output f32* %307 = OpAccessChain %296 %305 
                                              OpStore %307 %304 
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
  Name "Tilt Shift: Radial"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 174826
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
vec2 ImmCB_0_0_0[12];
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
int u_xlati6;
bool u_xlatb9;
void main()
{
	ImmCB_0_0_0[0] = vec2(-0.326211989, -0.405809999);
	ImmCB_0_0_0[1] = vec2(-0.840143979, -0.0735799968);
	ImmCB_0_0_0[2] = vec2(-0.69591397, 0.457136989);
	ImmCB_0_0_0[3] = vec2(-0.203345001, 0.620715976);
	ImmCB_0_0_0[4] = vec2(0.962339997, -0.194983006);
	ImmCB_0_0_0[5] = vec2(0.473434001, -0.480026007);
	ImmCB_0_0_0[6] = vec2(0.519456029, 0.767022014);
	ImmCB_0_0_0[7] = vec2(0.185461, -0.893123984);
	ImmCB_0_0_0[8] = vec2(0.507430971, 0.0644249991);
	ImmCB_0_0_0[9] = vec2(0.896420002, 0.412458003);
	ImmCB_0_0_0[10] = vec2(-0.321940005, -0.932614982);
	ImmCB_0_0_0[11] = vec2(-0.791558981, -0.597710013);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Params.x);
    u_xlat3 = float(1.0) / _Params.y;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * 0.00999999978;
    u_xlat3 = u_xlat0.x * _Params.z;
    u_xlat3 = u_xlat3 * 0.5;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<12 ; u_xlati_loop_1++)
    {
        u_xlat2.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * vec2(u_xlat3) + vs_TEXCOORD1.xy;
        u_xlat2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    SV_Target0.w = u_xlat0.x;
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
; Bound: 208
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %165 %191 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %33 0 Offset 33 
                                              OpDecorate %33 Block 
                                              OpDecorate %35 DescriptorSet 35 
                                              OpDecorate %35 Binding 35 
                                              OpDecorate vs_TEXCOORD1 Location 165 
                                              OpDecorate %172 DescriptorSet 172 
                                              OpDecorate %172 Binding 172 
                                              OpDecorate %176 DescriptorSet 176 
                                              OpDecorate %176 Binding 176 
                                              OpDecorate %191 Location 191 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %13 = OpConstant 3.674022E-40 
                                f32_2 %14 = OpConstantComposite %13 %13 
                                  f32 %16 = OpConstant 3.674022E-40 
                                f32_2 %17 = OpConstantComposite %16 %16 
                                      %22 = OpTypeInt 32 0 
                                  u32 %23 = OpConstant 0 
                                      %24 = OpTypePointer Private %6 
                                      %32 = OpTypeVector %6 4 
                                      %33 = OpTypeStruct %32 
                                      %34 = OpTypePointer Uniform %33 
             Uniform struct {f32_4;}* %35 = OpVariable Uniform 
                                      %36 = OpTypeInt 32 1 
                                  i32 %37 = OpConstant 0 
                                      %38 = OpTypePointer Uniform %6 
                         Private f32* %44 = OpVariable Private 
                                  f32 %45 = OpConstant 3.674022E-40 
                                  u32 %46 = OpConstant 1 
                                  f32 %57 = OpConstant 3.674022E-40 
                                  f32 %62 = OpConstant 3.674022E-40 
                                  f32 %64 = OpConstant 3.674022E-40 
                                  f32 %83 = OpConstant 3.674022E-40 
                                  u32 %88 = OpConstant 2 
                                  f32 %93 = OpConstant 3.674022E-40 
                                      %95 = OpTypeVector %6 3 
                                      %96 = OpTypePointer Private %95 
                       Private f32_3* %97 = OpVariable Private 
                                     %101 = OpTypePointer Function %36 
                                 i32 %109 = OpConstant 12 
                                     %110 = OpTypeBool 
                      Private f32_3* %112 = OpVariable Private 
                                     %113 = OpTypeVector %22 4 
                                 u32 %114 = OpConstant 12 
                                     %115 = OpTypeArray %113 %114 
                                 u32 %116 = OpConstant 3198616898 
                                 u32 %117 = OpConstant 3201287764 
                               u32_4 %118 = OpConstantComposite %116 %117 %23 %23 
                                 u32 %119 = OpConstant 3210154925 
                                 u32 %120 = OpConstant 3180769564 
                               u32_4 %121 = OpConstantComposite %119 %120 %23 %23 
                                 u32 %122 = OpConstant 3207735147 
                                 u32 %123 = OpConstant 1055526364 
                               u32_4 %124 = OpConstantComposite %122 %123 %23 %23 
                                 u32 %125 = OpConstant 3192928684 
                                 u32 %126 = OpConstant 1058989886 
                               u32_4 %127 = OpConstantComposite %125 %126 %23 %23 
                                 u32 %128 = OpConstant 1064721386 
                                 u32 %129 = OpConstant 3192367520 
                               u32_4 %130 = OpConstantComposite %128 %129 %23 %23 
                                 u32 %131 = OpConstant 1056073201 
                                 u32 %132 = OpConstant 3203778040 
                               u32_4 %133 = OpConstantComposite %131 %132 %23 %23 
                                 u32 %134 = OpConstant 1057291026 
                                 u32 %135 = OpConstant 1061444494 
                               u32_4 %136 = OpConstantComposite %134 %135 %23 %23 
                                 u32 %137 = OpConstant 1044244861 
                                 u32 %138 = OpConstant 3211043782 
                               u32_4 %139 = OpConstantComposite %137 %138 %23 %23 
                                 u32 %140 = OpConstant 1057089279 
                                 u32 %141 = OpConstant 1032057153 
                               u32_4 %142 = OpConstantComposite %140 %141 %23 %23 
                                 u32 %143 = OpConstant 1063615432 
                                 u32 %144 = OpConstant 1054027186 
                               u32_4 %145 = OpConstantComposite %143 %144 %23 %23 
                                 u32 %146 = OpConstant 3198473554 
                                 u32 %147 = OpConstant 3211706331 
                               u32_4 %148 = OpConstantComposite %146 %147 %23 %23 
                                 u32 %149 = OpConstant 3209339804 
                                 u32 %150 = OpConstant 3206087558 
                               u32_4 %151 = OpConstantComposite %149 %150 %23 %23 
                           u32_4[12] %152 = OpConstantComposite %118 %121 %124 %127 %130 %133 %136 %139 %142 %145 %148 %151 
                                     %154 = OpTypeVector %22 2 
                                     %155 = OpTypePointer Function %115 
                                     %157 = OpTypePointer Function %113 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %170 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %171 = OpTypePointer UniformConstant %170 
UniformConstant read_only Texture2D* %172 = OpVariable UniformConstant 
                                     %174 = OpTypeSampler 
                                     %175 = OpTypePointer UniformConstant %174 
            UniformConstant sampler* %176 = OpVariable UniformConstant 
                                     %178 = OpTypeSampledImage %170 
                                 i32 %188 = OpConstant 1 
                                     %190 = OpTypePointer Output %32 
                       Output f32_4* %191 = OpVariable Output 
                                 f32 %193 = OpConstant 3.674022E-40 
                               f32_3 %194 = OpConstantComposite %193 %193 %193 
                                 u32 %200 = OpConstant 3 
                                     %201 = OpTypePointer Output %6 
                                     %204 = OpTypePointer Private %36 
                        Private i32* %205 = OpVariable Private 
                                     %206 = OpTypePointer Private %110 
                       Private bool* %207 = OpVariable Private 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function i32* %102 = OpVariable Function 
                 Function u32_4[12]* %156 = OpVariable Function 
                                f32_2 %12 = OpLoad vs_TEXCOORD0 
                                f32_2 %15 = OpFMul %12 %14 
                                f32_2 %18 = OpFAdd %15 %17 
                                              OpStore %9 %18 
                                f32_2 %19 = OpLoad %9 
                                f32_2 %20 = OpLoad %9 
                                  f32 %21 = OpDot %19 %20 
                         Private f32* %25 = OpAccessChain %9 %23 
                                              OpStore %25 %21 
                         Private f32* %26 = OpAccessChain %9 %23 
                                  f32 %27 = OpLoad %26 
                                  f32 %28 = OpExtInst %1 31 %27 
                         Private f32* %29 = OpAccessChain %9 %23 
                                              OpStore %29 %28 
                         Private f32* %30 = OpAccessChain %9 %23 
                                  f32 %31 = OpLoad %30 
                         Uniform f32* %39 = OpAccessChain %35 %37 %23 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpFNegate %40 
                                  f32 %42 = OpFAdd %31 %41 
                         Private f32* %43 = OpAccessChain %9 %23 
                                              OpStore %43 %42 
                         Uniform f32* %47 = OpAccessChain %35 %37 %46 
                                  f32 %48 = OpLoad %47 
                                  f32 %49 = OpFDiv %45 %48 
                                              OpStore %44 %49 
                                  f32 %50 = OpLoad %44 
                         Private f32* %51 = OpAccessChain %9 %23 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFMul %50 %52 
                         Private f32* %54 = OpAccessChain %9 %23 
                                              OpStore %54 %53 
                         Private f32* %55 = OpAccessChain %9 %23 
                                  f32 %56 = OpLoad %55 
                                  f32 %58 = OpExtInst %1 43 %56 %57 %45 
                         Private f32* %59 = OpAccessChain %9 %23 
                                              OpStore %59 %58 
                         Private f32* %60 = OpAccessChain %9 %23 
                                  f32 %61 = OpLoad %60 
                                  f32 %63 = OpFMul %61 %62 
                                  f32 %65 = OpFAdd %63 %64 
                                              OpStore %44 %65 
                         Private f32* %66 = OpAccessChain %9 %23 
                                  f32 %67 = OpLoad %66 
                         Private f32* %68 = OpAccessChain %9 %23 
                                  f32 %69 = OpLoad %68 
                                  f32 %70 = OpFMul %67 %69 
                         Private f32* %71 = OpAccessChain %9 %23 
                                              OpStore %71 %70 
                         Private f32* %72 = OpAccessChain %9 %23 
                                  f32 %73 = OpLoad %72 
                                  f32 %74 = OpLoad %44 
                                  f32 %75 = OpFMul %73 %74 
                         Private f32* %76 = OpAccessChain %9 %23 
                                              OpStore %76 %75 
                         Private f32* %77 = OpAccessChain %9 %23 
                                  f32 %78 = OpLoad %77 
                                  f32 %79 = OpExtInst %1 37 %78 %45 
                         Private f32* %80 = OpAccessChain %9 %23 
                                              OpStore %80 %79 
                         Private f32* %81 = OpAccessChain %9 %23 
                                  f32 %82 = OpLoad %81 
                                  f32 %84 = OpFMul %82 %83 
                         Private f32* %85 = OpAccessChain %9 %23 
                                              OpStore %85 %84 
                         Private f32* %86 = OpAccessChain %9 %23 
                                  f32 %87 = OpLoad %86 
                         Uniform f32* %89 = OpAccessChain %35 %37 %88 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFMul %87 %90 
                                              OpStore %44 %91 
                                  f32 %92 = OpLoad %44 
                                  f32 %94 = OpFMul %92 %93 
                                              OpStore %44 %94 
                         Private f32* %98 = OpAccessChain %97 %23 
                                              OpStore %98 %57 
                         Private f32* %99 = OpAccessChain %97 %46 
                                              OpStore %99 %57 
                        Private f32* %100 = OpAccessChain %97 %88 
                                              OpStore %100 %57 
                                              OpStore %102 %37 
                                              OpBranch %103 
                                     %103 = OpLabel 
                                              OpLoopMerge %105 %106 None 
                                              OpBranch %107 
                                     %107 = OpLabel 
                                 i32 %108 = OpLoad %102 
                                bool %111 = OpSLessThan %108 %109 
                                              OpBranchConditional %111 %104 %105 
                                     %104 = OpLabel 
                                 i32 %153 = OpLoad %102 
                                              OpStore %156 %152 
                     Function u32_4* %158 = OpAccessChain %156 %153 
                               u32_4 %159 = OpLoad %158 
                               u32_2 %160 = OpVectorShuffle %159 %159 0 1 
                               f32_2 %161 = OpBitcast %160 
                                 f32 %162 = OpLoad %44 
                               f32_2 %163 = OpCompositeConstruct %162 %162 
                               f32_2 %164 = OpFMul %161 %163 
                               f32_2 %166 = OpLoad vs_TEXCOORD1 
                               f32_2 %167 = OpFAdd %164 %166 
                               f32_3 %168 = OpLoad %112 
                               f32_3 %169 = OpVectorShuffle %168 %167 3 4 2 
                                              OpStore %112 %169 
                 read_only Texture2D %173 = OpLoad %172 
                             sampler %177 = OpLoad %176 
          read_only Texture2DSampled %179 = OpSampledImage %173 %177 
                               f32_3 %180 = OpLoad %112 
                               f32_2 %181 = OpVectorShuffle %180 %180 0 1 
                               f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                               f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                              OpStore %112 %183 
                               f32_3 %184 = OpLoad %97 
                               f32_3 %185 = OpLoad %112 
                               f32_3 %186 = OpFAdd %184 %185 
                                              OpStore %97 %186 
                                              OpBranch %106 
                                     %106 = OpLabel 
                                 i32 %187 = OpLoad %102 
                                 i32 %189 = OpIAdd %187 %188 
                                              OpStore %102 %189 
                                              OpBranch %103 
                                     %105 = OpLabel 
                               f32_3 %192 = OpLoad %97 
                               f32_3 %195 = OpFMul %192 %194 
                               f32_4 %196 = OpLoad %191 
                               f32_4 %197 = OpVectorShuffle %196 %195 4 5 6 3 
                                              OpStore %191 %197 
                        Private f32* %198 = OpAccessChain %9 %23 
                                 f32 %199 = OpLoad %198 
                         Output f32* %202 = OpAccessChain %191 %200 
                                              OpStore %202 %199 
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
  Name "Tilt Shift: Radial (HQ)"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 260703
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
vec2 ImmCB_0_0_0[28];
uniform 	vec4 _Params;
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
vec3 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
int u_xlati6;
bool u_xlatb9;
void main()
{
	ImmCB_0_0_0[0] = vec2(0.624629974, 0.543370008);
	ImmCB_0_0_0[1] = vec2(-0.13414, -0.944880009);
	ImmCB_0_0_0[2] = vec2(0.387719989, -0.434749991);
	ImmCB_0_0_0[3] = vec2(0.121260002, -0.192819998);
	ImmCB_0_0_0[4] = vec2(-0.203879997, 0.111330003);
	ImmCB_0_0_0[5] = vec2(0.831139982, -0.292180002);
	ImmCB_0_0_0[6] = vec2(0.107589997, -0.578390002);
	ImmCB_0_0_0[7] = vec2(0.282849997, 0.790359974);
	ImmCB_0_0_0[8] = vec2(-0.366219997, 0.39515999);
	ImmCB_0_0_0[9] = vec2(0.755909979, 0.219160005);
	ImmCB_0_0_0[10] = vec2(-0.52609998, 0.0238600001);
	ImmCB_0_0_0[11] = vec2(-0.882160008, -0.244709998);
	ImmCB_0_0_0[12] = vec2(-0.488880008, -0.293300003);
	ImmCB_0_0_0[13] = vec2(0.440140009, -0.0855799988);
	ImmCB_0_0_0[14] = vec2(0.211789995, 0.51372999);
	ImmCB_0_0_0[15] = vec2(0.0548299998, 0.957009971);
	ImmCB_0_0_0[16] = vec2(-0.590009987, -0.705089986);
	ImmCB_0_0_0[17] = vec2(-0.800650001, 0.246309996);
	ImmCB_0_0_0[18] = vec2(-0.194240004, -0.184019998);
	ImmCB_0_0_0[19] = vec2(-0.436670005, 0.767509997);
	ImmCB_0_0_0[20] = vec2(0.216659993, 0.116020001);
	ImmCB_0_0_0[21] = vec2(0.156959996, -0.856000006);
	ImmCB_0_0_0[22] = vec2(-0.758210003, 0.583630025);
	ImmCB_0_0_0[23] = vec2(0.992839992, -0.0290399995);
	ImmCB_0_0_0[24] = vec2(-0.222340003, -0.579069972);
	ImmCB_0_0_0[25] = vec2(0.550520003, -0.669839978);
	ImmCB_0_0_0[26] = vec2(0.46430999, 0.281150013);
	ImmCB_0_0_0[27] = vec2(-0.0721400008, 0.605539978);
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + (-_Params.x);
    u_xlat3 = float(1.0) / _Params.y;
    u_xlat0.x = u_xlat3 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat3 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat0.x = u_xlat0.x * 0.00999999978;
    u_xlat3 = u_xlat0.x * _Params.z;
    u_xlat1.x = float(0.0);
    u_xlat1.y = float(0.0);
    u_xlat1.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<28 ; u_xlati_loop_1++)
    {
        u_xlat2.xy = ImmCB_0_0_0[u_xlati_loop_1].xy * vec2(u_xlat3) + vs_TEXCOORD1.xy;
        u_xlat2 = texture(_MainTex, u_xlat2.xy);
        u_xlat1.xyz = u_xlat1.xyz + u_xlat2.xyz;
    }
    SV_Target0.xyz = u_xlat1.xyz * vec3(0.0357142873, 0.0357142873, 0.0357142873);
    SV_Target0.w = u_xlat0.x;
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
; Bound: 281
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %238 %264 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate vs_TEXCOORD0 Location 11 
                                              OpMemberDecorate %33 0 Offset 33 
                                              OpDecorate %33 Block 
                                              OpDecorate %35 DescriptorSet 35 
                                              OpDecorate %35 Binding 35 
                                              OpDecorate vs_TEXCOORD1 Location 238 
                                              OpDecorate %245 DescriptorSet 245 
                                              OpDecorate %245 Binding 245 
                                              OpDecorate %249 DescriptorSet 249 
                                              OpDecorate %249 Binding 249 
                                              OpDecorate %264 Location 264 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Private %7 
                        Private f32_2* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                  f32 %13 = OpConstant 3.674022E-40 
                                f32_2 %14 = OpConstantComposite %13 %13 
                                  f32 %16 = OpConstant 3.674022E-40 
                                f32_2 %17 = OpConstantComposite %16 %16 
                                      %22 = OpTypeInt 32 0 
                                  u32 %23 = OpConstant 0 
                                      %24 = OpTypePointer Private %6 
                                      %32 = OpTypeVector %6 4 
                                      %33 = OpTypeStruct %32 
                                      %34 = OpTypePointer Uniform %33 
             Uniform struct {f32_4;}* %35 = OpVariable Uniform 
                                      %36 = OpTypeInt 32 1 
                                  i32 %37 = OpConstant 0 
                                      %38 = OpTypePointer Uniform %6 
                         Private f32* %44 = OpVariable Private 
                                  f32 %45 = OpConstant 3.674022E-40 
                                  u32 %46 = OpConstant 1 
                                  f32 %57 = OpConstant 3.674022E-40 
                                  f32 %62 = OpConstant 3.674022E-40 
                                  f32 %64 = OpConstant 3.674022E-40 
                                  f32 %83 = OpConstant 3.674022E-40 
                                  u32 %88 = OpConstant 2 
                                      %92 = OpTypeVector %6 3 
                                      %93 = OpTypePointer Private %92 
                       Private f32_3* %94 = OpVariable Private 
                                      %98 = OpTypePointer Function %36 
                                 i32 %106 = OpConstant 28 
                                     %107 = OpTypeBool 
                      Private f32_3* %109 = OpVariable Private 
                                     %110 = OpTypeVector %22 4 
                                 u32 %111 = OpConstant 28 
                                     %112 = OpTypeArray %110 %111 
                                 u32 %113 = OpConstant 1059055552 
                                 u32 %114 = OpConstant 1057692236 
                                 u32 %115 = OpConstant 1062465857 
                               u32_4 %116 = OpConstantComposite %113 %114 %115 %23 
                                 u32 %117 = OpConstant 3188284415 
                                 u32 %118 = OpConstant 3211912104 
                                 u32 %119 = OpConstant 1064587336 
                               u32_4 %120 = OpConstantComposite %117 %118 %119 %23 
                                 u32 %121 = OpConstant 1053197116 
                                 u32 %122 = OpConstant 3202258829 
                                 u32 %123 = OpConstant 1058349232 
                               u32_4 %124 = OpConstantComposite %121 %122 %123 %23 
                                 u32 %125 = OpConstant 1039685418 
                                 u32 %126 = OpConstant 3192222363 
                                 u32 %127 = OpConstant 1047084841 
                               u32_4 %128 = OpConstantComposite %125 %126 %127 %23 
                                 u32 %129 = OpConstant 3192964587 
                                 u32 %130 = OpConstant 1038352636 
                                 u32 %131 = OpConstant 1047388173 
                               u32_4 %132 = OpConstantComposite %129 %130 %131 %23 
                                 u32 %133 = OpConstant 1062520215 
                                 u32 %134 = OpConstant 3197474974 
                                 u32 %135 = OpConstant 1063356727 
                               u32_4 %136 = OpConstantComposite %133 %134 %135 %23 
                                 u32 %137 = OpConstant 1037850661 
                                 u32 %138 = OpConstant 3205763422 
                                 u32 %139 = OpConstant 1058446204 
                               u32_4 %140 = OpConstantComposite %137 %138 %139 %23 
                                 u32 %141 = OpConstant 1049678263 
                                 u32 %142 = OpConstant 1061836040 
                                 u32 %143 = OpConstant 1062659634 
                               u32_4 %144 = OpConstantComposite %141 %142 %143 %23 
                                 u32 %145 = OpConstant 3199959344 
                                 u32 %146 = OpConstant 1053446761 
                                 u32 %147 = OpConstant 1057614893 
                               u32_4 %148 = OpConstantComposite %145 %146 %147 %23 
                                 u32 %149 = OpConstant 1061258065 
                                 u32 %150 = OpConstant 1046506363 
                                 u32 %151 = OpConstant 1061780340 
                               u32_4 %152 = OpConstantComposite %149 %150 %151 %23 
                                 u32 %153 = OpConstant 3204886141 
                                 u32 %154 = OpConstant 1019442700 
                                 u32 %155 = OpConstant 1057411553 
                               u32_4 %156 = OpConstantComposite %153 %154 %155 %23 
                                 u32 %157 = OpConstant 3210859837 
                                 u32 %158 = OpConstant 3195704642 
                                 u32 %159 = OpConstant 1063935038 
                               u32_4 %160 = OpConstantComposite %157 %158 %159 %23 
                                 u32 %161 = OpConstant 3204075131 
                                 u32 %162 = OpConstant 3197512555 
                                 u32 %163 = OpConstant 1058140859 
                               u32_4 %164 = OpConstantComposite %161 %162 %163 %23 
                                 u32 %165 = OpConstant 1054956040 
                                 u32 %166 = OpConstant 3182380177 
                                 u32 %167 = OpConstant 1055232528 
                               u32_4 %168 = OpConstantComposite %165 %166 %167 %23 
                                 u32 %169 = OpConstant 1046011770 
                                 u32 %170 = OpConstant 1057194959 
                                 u32 %171 = OpConstant 1057898596 
                               u32_4 %172 = OpConstantComposite %169 %170 %171 %23 
                                 u32 %173 = OpConstant 1029739884 
                                 u32 %174 = OpConstant 1064631963 
                                 u32 %175 = OpConstant 1064658304 
                               u32_4 %176 = OpConstantComposite %173 %174 %175 %23 
                                 u32 %177 = OpConstant 3205958373 
                                 u32 %178 = OpConstant 3207889095 
                                 u32 %179 = OpConstant 1064000637 
                               u32_4 %180 = OpConstantComposite %177 %178 %179 %23 
                                 u32 %181 = OpConstant 3209492326 
                                 u32 %182 = OpConstant 1048328368 
                                 u32 %183 = OpConstant 1062629938 
                               u32_4 %184 = OpConstantComposite %181 %182 %183 %23 
                                 u32 %185 = OpConstant 3192317658 
                                 u32 %186 = OpConstant 3191631805 
                                 u32 %187 = OpConstant 1049165551 
                               u32_4 %188 = OpConstantComposite %185 %186 %187 %23 
                                 u32 %189 = OpConstant 3202323254 
                                 u32 %190 = OpConstant 1061452681 
                                 u32 %191 = OpConstant 1063390953 
                               u32_4 %192 = OpConstantComposite %189 %190 %191 %23 
                                 u32 %193 = OpConstant 1046338590 
                                 u32 %194 = OpConstant 1038982117 
                                 u32 %195 = OpConstant 1048292130 
                               u32_4 %196 = OpConstantComposite %193 %194 %195 %23 
                                 u32 %197 = OpConstant 1042332191 
                                 u32 %198 = OpConstant 3210420945 
                                 u32 %199 = OpConstant 1063176708 
                               u32_4 %200 = OpConstantComposite %197 %198 %199 %23 
                                 u32 %201 = OpConstant 3208780301 
                                 u32 %202 = OpConstant 1058367687 
                                 u32 %203 = OpConstant 1064628776 
                               u32_4 %204 = OpConstantComposite %201 %202 %203 %23 
                                 u32 %205 = OpConstant 1065233091 
                                 u32 %206 = OpConstant 3169707339 
                                 u32 %207 = OpConstant 1065240305 
                               u32_4 %208 = OpConstantComposite %205 %206 %207 %23 
                                 u32 %209 = OpConstant 3194203417 
                                 u32 %210 = OpConstant 3205774830 
                                 u32 %211 = OpConstant 1058982739 
                               u32_4 %212 = OpConstantComposite %209 %210 %211 %23 
                                 u32 %213 = OpConstant 1057812193 
                                 u32 %214 = OpConstant 3207297698 
                                 u32 %215 = OpConstant 1063122517 
                               u32_4 %216 = OpConstantComposite %213 %214 %215 %23 
                                 u32 %217 = OpConstant 1055767050 
                                 u32 %218 = OpConstant 1049621221 
                                 u32 %219 = OpConstant 1057682673 
                               u32_4 %220 = OpConstantComposite %217 %218 %219 %23 
                                 u32 %221 = OpConstant 3180576291 
                                 u32 %222 = OpConstant 1058735275 
                                 u32 %223 = OpConstant 1058807082 
                               u32_4 %224 = OpConstantComposite %221 %222 %223 %23 
                           u32_4[28] %225 = OpConstantComposite %116 %120 %124 %128 %132 %136 %140 %144 %148 %152 %156 %160 %164 %168 %172 %176 %180 %184 %188 %192 %196 %200 %204 %208 %212 %216 %220 %224 
                                     %227 = OpTypeVector %22 2 
                                     %228 = OpTypePointer Function %112 
                                     %230 = OpTypePointer Function %110 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %243 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %244 = OpTypePointer UniformConstant %243 
UniformConstant read_only Texture2D* %245 = OpVariable UniformConstant 
                                     %247 = OpTypeSampler 
                                     %248 = OpTypePointer UniformConstant %247 
            UniformConstant sampler* %249 = OpVariable UniformConstant 
                                     %251 = OpTypeSampledImage %243 
                                 i32 %261 = OpConstant 1 
                                     %263 = OpTypePointer Output %32 
                       Output f32_4* %264 = OpVariable Output 
                                 f32 %266 = OpConstant 3.674022E-40 
                               f32_3 %267 = OpConstantComposite %266 %266 %266 
                                 u32 %273 = OpConstant 3 
                                     %274 = OpTypePointer Output %6 
                                     %277 = OpTypePointer Private %36 
                        Private i32* %278 = OpVariable Private 
                                     %279 = OpTypePointer Private %107 
                       Private bool* %280 = OpVariable Private 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                        Function i32* %99 = OpVariable Function 
                 Function u32_4[28]* %229 = OpVariable Function 
                                f32_2 %12 = OpLoad vs_TEXCOORD0 
                                f32_2 %15 = OpFMul %12 %14 
                                f32_2 %18 = OpFAdd %15 %17 
                                              OpStore %9 %18 
                                f32_2 %19 = OpLoad %9 
                                f32_2 %20 = OpLoad %9 
                                  f32 %21 = OpDot %19 %20 
                         Private f32* %25 = OpAccessChain %9 %23 
                                              OpStore %25 %21 
                         Private f32* %26 = OpAccessChain %9 %23 
                                  f32 %27 = OpLoad %26 
                                  f32 %28 = OpExtInst %1 31 %27 
                         Private f32* %29 = OpAccessChain %9 %23 
                                              OpStore %29 %28 
                         Private f32* %30 = OpAccessChain %9 %23 
                                  f32 %31 = OpLoad %30 
                         Uniform f32* %39 = OpAccessChain %35 %37 %23 
                                  f32 %40 = OpLoad %39 
                                  f32 %41 = OpFNegate %40 
                                  f32 %42 = OpFAdd %31 %41 
                         Private f32* %43 = OpAccessChain %9 %23 
                                              OpStore %43 %42 
                         Uniform f32* %47 = OpAccessChain %35 %37 %46 
                                  f32 %48 = OpLoad %47 
                                  f32 %49 = OpFDiv %45 %48 
                                              OpStore %44 %49 
                                  f32 %50 = OpLoad %44 
                         Private f32* %51 = OpAccessChain %9 %23 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFMul %50 %52 
                         Private f32* %54 = OpAccessChain %9 %23 
                                              OpStore %54 %53 
                         Private f32* %55 = OpAccessChain %9 %23 
                                  f32 %56 = OpLoad %55 
                                  f32 %58 = OpExtInst %1 43 %56 %57 %45 
                         Private f32* %59 = OpAccessChain %9 %23 
                                              OpStore %59 %58 
                         Private f32* %60 = OpAccessChain %9 %23 
                                  f32 %61 = OpLoad %60 
                                  f32 %63 = OpFMul %61 %62 
                                  f32 %65 = OpFAdd %63 %64 
                                              OpStore %44 %65 
                         Private f32* %66 = OpAccessChain %9 %23 
                                  f32 %67 = OpLoad %66 
                         Private f32* %68 = OpAccessChain %9 %23 
                                  f32 %69 = OpLoad %68 
                                  f32 %70 = OpFMul %67 %69 
                         Private f32* %71 = OpAccessChain %9 %23 
                                              OpStore %71 %70 
                         Private f32* %72 = OpAccessChain %9 %23 
                                  f32 %73 = OpLoad %72 
                                  f32 %74 = OpLoad %44 
                                  f32 %75 = OpFMul %73 %74 
                         Private f32* %76 = OpAccessChain %9 %23 
                                              OpStore %76 %75 
                         Private f32* %77 = OpAccessChain %9 %23 
                                  f32 %78 = OpLoad %77 
                                  f32 %79 = OpExtInst %1 37 %78 %45 
                         Private f32* %80 = OpAccessChain %9 %23 
                                              OpStore %80 %79 
                         Private f32* %81 = OpAccessChain %9 %23 
                                  f32 %82 = OpLoad %81 
                                  f32 %84 = OpFMul %82 %83 
                         Private f32* %85 = OpAccessChain %9 %23 
                                              OpStore %85 %84 
                         Private f32* %86 = OpAccessChain %9 %23 
                                  f32 %87 = OpLoad %86 
                         Uniform f32* %89 = OpAccessChain %35 %37 %88 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFMul %87 %90 
                                              OpStore %44 %91 
                         Private f32* %95 = OpAccessChain %94 %23 
                                              OpStore %95 %57 
                         Private f32* %96 = OpAccessChain %94 %46 
                                              OpStore %96 %57 
                         Private f32* %97 = OpAccessChain %94 %88 
                                              OpStore %97 %57 
                                              OpStore %99 %37 
                                              OpBranch %100 
                                     %100 = OpLabel 
                                              OpLoopMerge %102 %103 None 
                                              OpBranch %104 
                                     %104 = OpLabel 
                                 i32 %105 = OpLoad %99 
                                bool %108 = OpSLessThan %105 %106 
                                              OpBranchConditional %108 %101 %102 
                                     %101 = OpLabel 
                                 i32 %226 = OpLoad %99 
                                              OpStore %229 %225 
                     Function u32_4* %231 = OpAccessChain %229 %226 
                               u32_4 %232 = OpLoad %231 
                               u32_2 %233 = OpVectorShuffle %232 %232 0 1 
                               f32_2 %234 = OpBitcast %233 
                                 f32 %235 = OpLoad %44 
                               f32_2 %236 = OpCompositeConstruct %235 %235 
                               f32_2 %237 = OpFMul %234 %236 
                               f32_2 %239 = OpLoad vs_TEXCOORD1 
                               f32_2 %240 = OpFAdd %237 %239 
                               f32_3 %241 = OpLoad %109 
                               f32_3 %242 = OpVectorShuffle %241 %240 3 4 2 
                                              OpStore %109 %242 
                 read_only Texture2D %246 = OpLoad %245 
                             sampler %250 = OpLoad %249 
          read_only Texture2DSampled %252 = OpSampledImage %246 %250 
                               f32_3 %253 = OpLoad %109 
                               f32_2 %254 = OpVectorShuffle %253 %253 0 1 
                               f32_4 %255 = OpImageSampleImplicitLod %252 %254 
                               f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                                              OpStore %109 %256 
                               f32_3 %257 = OpLoad %94 
                               f32_3 %258 = OpLoad %109 
                               f32_3 %259 = OpFAdd %257 %258 
                                              OpStore %94 %259 
                                              OpBranch %103 
                                     %103 = OpLabel 
                                 i32 %260 = OpLoad %99 
                                 i32 %262 = OpIAdd %260 %261 
                                              OpStore %99 %262 
                                              OpBranch %100 
                                     %102 = OpLabel 
                               f32_3 %265 = OpLoad %94 
                               f32_3 %268 = OpFMul %265 %267 
                               f32_4 %269 = OpLoad %264 
                               f32_4 %270 = OpVectorShuffle %269 %268 4 5 6 3 
                                              OpStore %264 %270 
                        Private f32* %271 = OpAccessChain %9 %23 
                                 f32 %272 = OpLoad %271 
                         Output f32* %275 = OpAccessChain %264 %273 
                                              OpStore %275 %272 
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
  Name "Tilt Shift: Composite"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 265543
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

#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform  sampler2D _MainTex;
UNITY_LOCATION(1) uniform  sampler2D _BlurredTex;
in  vec2 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat1 = texture(_BlurredTex, vs_TEXCOORD1.xy);
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    SV_Target0.w = u_xlat0.w;
    SV_Target0.xyz = u_xlat1.www * u_xlat0.xyz + u_xlat1.xyz;
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
; Bound: 62
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %43 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate vs_TEXCOORD1 Location 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %43 Location 43 
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
                      Private f32_4* %25 = OpVariable Private 
UniformConstant read_only Texture2D* %26 = OpVariable UniformConstant 
            UniformConstant sampler* %28 = OpVariable UniformConstant 
                                     %33 = OpTypeVector %6 3 
                                     %42 = OpTypePointer Output %7 
                       Output f32_4* %43 = OpVariable Output 
                                     %44 = OpTypeInt 32 0 
                                 u32 %45 = OpConstant 3 
                                     %46 = OpTypePointer Private %6 
                                     %49 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                 read_only Texture2D %27 = OpLoad %26 
                             sampler %29 = OpLoad %28 
          read_only Texture2DSampled %30 = OpSampledImage %27 %29 
                               f32_2 %31 = OpLoad vs_TEXCOORD1 
                               f32_4 %32 = OpImageSampleImplicitLod %30 %31 
                                             OpStore %25 %32 
                               f32_4 %34 = OpLoad %9 
                               f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                               f32_4 %36 = OpLoad %25 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_3 %38 = OpFNegate %37 
                               f32_3 %39 = OpFAdd %35 %38 
                               f32_4 %40 = OpLoad %9 
                               f32_4 %41 = OpVectorShuffle %40 %39 4 5 6 3 
                                             OpStore %9 %41 
                        Private f32* %47 = OpAccessChain %9 %45 
                                 f32 %48 = OpLoad %47 
                         Output f32* %50 = OpAccessChain %43 %45 
                                             OpStore %50 %48 
                               f32_4 %51 = OpLoad %25 
                               f32_3 %52 = OpVectorShuffle %51 %51 3 3 3 
                               f32_4 %53 = OpLoad %9 
                               f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               f32_3 %55 = OpFMul %52 %54 
                               f32_4 %56 = OpLoad %25 
                               f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               f32_3 %58 = OpFAdd %55 %57 
                               f32_4 %59 = OpLoad %43 
                               f32_4 %60 = OpVectorShuffle %59 %58 4 5 6 3 
                                             OpStore %43 %60 
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
  Name "Tilt Shift: Debug"
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 381811
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
uniform 	vec4 _Params;
uniform 	float _Offset;
uniform 	float _Angle;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec2 u_xlat0;
float u_xlat1;
vec2 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.y = cos(_Angle);
    u_xlat2.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
    u_xlat0.x = sin((-_Angle));
    u_xlat0.x = dot(u_xlat2.xy, u_xlat0.xy);
    u_xlat0.x = u_xlat0.x + 0.5;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x + (-_Offset);
    u_xlat0.x = min(abs(u_xlat0.x), 1.0);
    u_xlat0.x = u_xlat0.x + (-_Params.x);
    u_xlat1 = float(1.0) / _Params.y;
    u_xlat0.x = u_xlat1 * u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat2.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat2.x;
    u_xlat2.xy = vs_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.x = dot(u_xlat2.xy, u_xlat2.xy);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + (-_Params.x);
    u_xlat1 = u_xlat1 * u_xlat2.x;
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
    u_xlat2.x = u_xlat1 * -2.0 + 3.0;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat0.y = u_xlat1 * u_xlat2.x;
    u_xlat0.xy = min(u_xlat0.xy, vec2(1.0, 1.0));
    u_xlatb2 = _Params.w==0.0;
    SV_Target0 = (bool(u_xlatb2)) ? u_xlat0.xxxx : u_xlat0.yyyy;
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
; Bound: 174
; Schema: 0
                                           OpCapability Shader 
                                    %1 = OpExtInstImport "GLSL.std.450" 
                                           OpMemoryModel Logical GLSL450 
                                           OpEntryPoint Fragment %4 "main" %26 %161 
                                           OpExecutionMode %4 OriginUpperLeft 
                                           OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                           OpMemberDecorate %11 0 Offset 11 
                                           OpMemberDecorate %11 1 Offset 11 
                                           OpMemberDecorate %11 2 Offset 11 
                                           OpDecorate %11 Block 
                                           OpDecorate %13 DescriptorSet 13 
                                           OpDecorate %13 Binding 13 
                                           OpDecorate vs_TEXCOORD0 Location 26 
                                           OpDecorate %161 Location 161 
                                    %2 = OpTypeVoid 
                                    %3 = OpTypeFunction %2 
                                    %6 = OpTypeFloat 32 
                                    %7 = OpTypeVector %6 2 
                                    %8 = OpTypePointer Private %7 
                     Private f32_2* %9 = OpVariable Private 
                                   %10 = OpTypeVector %6 4 
                                   %11 = OpTypeStruct %10 %6 %6 
                                   %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32; f32;}* %13 = OpVariable Uniform 
                                   %14 = OpTypeInt 32 1 
                               i32 %15 = OpConstant 2 
                                   %16 = OpTypePointer Uniform %6 
                                   %20 = OpTypeInt 32 0 
                               u32 %21 = OpConstant 1 
                                   %22 = OpTypePointer Private %6 
                    Private f32_2* %24 = OpVariable Private 
                                   %25 = OpTypePointer Input %7 
             Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                               f32 %28 = OpConstant 3.674022E-40 
                             f32_2 %29 = OpConstantComposite %28 %28 
                               u32 %35 = OpConstant 0 
                               f32 %43 = OpConstant 3.674022E-40 
                               f32 %48 = OpConstant 3.674022E-40 
                               f32 %49 = OpConstant 3.674022E-40 
                               f32 %54 = OpConstant 3.674022E-40 
                               f32 %56 = OpConstant 3.674022E-40 
                               i32 %61 = OpConstant 1 
                               i32 %74 = OpConstant 0 
                      Private f32* %80 = OpVariable Private 
                               f32 %95 = OpConstant 3.674022E-40 
                               f32 %97 = OpConstant 3.674022E-40 
                            f32_2 %113 = OpConstantComposite %54 %54 
                            f32_2 %115 = OpConstantComposite %56 %56 
                            f32_2 %151 = OpConstantComposite %49 %49 
                                  %153 = OpTypeBool 
                                  %154 = OpTypePointer Private %153 
                    Private bool* %155 = OpVariable Private 
                              u32 %156 = OpConstant 3 
                                  %160 = OpTypePointer Output %10 
                    Output f32_4* %161 = OpVariable Output 
                                  %163 = OpTypePointer Function %10 
                               void %4 = OpFunction None %3 
                                    %5 = OpLabel 
                  Function f32_4* %164 = OpVariable Function 
                      Uniform f32* %17 = OpAccessChain %13 %15 
                               f32 %18 = OpLoad %17 
                               f32 %19 = OpExtInst %1 14 %18 
                      Private f32* %23 = OpAccessChain %9 %21 
                                           OpStore %23 %19 
                             f32_2 %27 = OpLoad vs_TEXCOORD0 
                             f32_2 %30 = OpFAdd %27 %29 
                                           OpStore %24 %30 
                      Uniform f32* %31 = OpAccessChain %13 %15 
                               f32 %32 = OpLoad %31 
                               f32 %33 = OpFNegate %32 
                               f32 %34 = OpExtInst %1 13 %33 
                      Private f32* %36 = OpAccessChain %9 %35 
                                           OpStore %36 %34 
                             f32_2 %37 = OpLoad %24 
                             f32_2 %38 = OpLoad %9 
                               f32 %39 = OpDot %37 %38 
                      Private f32* %40 = OpAccessChain %9 %35 
                                           OpStore %40 %39 
                      Private f32* %41 = OpAccessChain %9 %35 
                               f32 %42 = OpLoad %41 
                               f32 %44 = OpFAdd %42 %43 
                      Private f32* %45 = OpAccessChain %9 %35 
                                           OpStore %45 %44 
                      Private f32* %46 = OpAccessChain %9 %35 
                               f32 %47 = OpLoad %46 
                               f32 %50 = OpExtInst %1 43 %47 %48 %49 
                      Private f32* %51 = OpAccessChain %9 %35 
                                           OpStore %51 %50 
                      Private f32* %52 = OpAccessChain %9 %35 
                               f32 %53 = OpLoad %52 
                               f32 %55 = OpFMul %53 %54 
                               f32 %57 = OpFAdd %55 %56 
                      Private f32* %58 = OpAccessChain %9 %35 
                                           OpStore %58 %57 
                      Private f32* %59 = OpAccessChain %9 %35 
                               f32 %60 = OpLoad %59 
                      Uniform f32* %62 = OpAccessChain %13 %61 
                               f32 %63 = OpLoad %62 
                               f32 %64 = OpFNegate %63 
                               f32 %65 = OpFAdd %60 %64 
                      Private f32* %66 = OpAccessChain %9 %35 
                                           OpStore %66 %65 
                      Private f32* %67 = OpAccessChain %9 %35 
                               f32 %68 = OpLoad %67 
                               f32 %69 = OpExtInst %1 4 %68 
                               f32 %70 = OpExtInst %1 37 %69 %49 
                      Private f32* %71 = OpAccessChain %9 %35 
                                           OpStore %71 %70 
                      Private f32* %72 = OpAccessChain %9 %35 
                               f32 %73 = OpLoad %72 
                      Uniform f32* %75 = OpAccessChain %13 %74 %35 
                               f32 %76 = OpLoad %75 
                               f32 %77 = OpFNegate %76 
                               f32 %78 = OpFAdd %73 %77 
                      Private f32* %79 = OpAccessChain %9 %35 
                                           OpStore %79 %78 
                      Uniform f32* %81 = OpAccessChain %13 %74 %21 
                               f32 %82 = OpLoad %81 
                               f32 %83 = OpFDiv %49 %82 
                                           OpStore %80 %83 
                               f32 %84 = OpLoad %80 
                      Private f32* %85 = OpAccessChain %9 %35 
                               f32 %86 = OpLoad %85 
                               f32 %87 = OpFMul %84 %86 
                      Private f32* %88 = OpAccessChain %9 %35 
                                           OpStore %88 %87 
                      Private f32* %89 = OpAccessChain %9 %35 
                               f32 %90 = OpLoad %89 
                               f32 %91 = OpExtInst %1 43 %90 %48 %49 
                      Private f32* %92 = OpAccessChain %9 %35 
                                           OpStore %92 %91 
                      Private f32* %93 = OpAccessChain %9 %35 
                               f32 %94 = OpLoad %93 
                               f32 %96 = OpFMul %94 %95 
                               f32 %98 = OpFAdd %96 %97 
                      Private f32* %99 = OpAccessChain %24 %35 
                                           OpStore %99 %98 
                     Private f32* %100 = OpAccessChain %9 %35 
                              f32 %101 = OpLoad %100 
                     Private f32* %102 = OpAccessChain %9 %35 
                              f32 %103 = OpLoad %102 
                              f32 %104 = OpFMul %101 %103 
                     Private f32* %105 = OpAccessChain %9 %35 
                                           OpStore %105 %104 
                     Private f32* %106 = OpAccessChain %9 %35 
                              f32 %107 = OpLoad %106 
                     Private f32* %108 = OpAccessChain %24 %35 
                              f32 %109 = OpLoad %108 
                              f32 %110 = OpFMul %107 %109 
                     Private f32* %111 = OpAccessChain %9 %35 
                                           OpStore %111 %110 
                            f32_2 %112 = OpLoad vs_TEXCOORD0 
                            f32_2 %114 = OpFMul %112 %113 
                            f32_2 %116 = OpFAdd %114 %115 
                                           OpStore %24 %116 
                            f32_2 %117 = OpLoad %24 
                            f32_2 %118 = OpLoad %24 
                              f32 %119 = OpDot %117 %118 
                     Private f32* %120 = OpAccessChain %24 %35 
                                           OpStore %120 %119 
                     Private f32* %121 = OpAccessChain %24 %35 
                              f32 %122 = OpLoad %121 
                              f32 %123 = OpExtInst %1 31 %122 
                     Private f32* %124 = OpAccessChain %24 %35 
                                           OpStore %124 %123 
                     Private f32* %125 = OpAccessChain %24 %35 
                              f32 %126 = OpLoad %125 
                     Uniform f32* %127 = OpAccessChain %13 %74 %35 
                              f32 %128 = OpLoad %127 
                              f32 %129 = OpFNegate %128 
                              f32 %130 = OpFAdd %126 %129 
                     Private f32* %131 = OpAccessChain %24 %35 
                                           OpStore %131 %130 
                              f32 %132 = OpLoad %80 
                     Private f32* %133 = OpAccessChain %24 %35 
                              f32 %134 = OpLoad %133 
                              f32 %135 = OpFMul %132 %134 
                                           OpStore %80 %135 
                              f32 %136 = OpLoad %80 
                              f32 %137 = OpExtInst %1 43 %136 %48 %49 
                                           OpStore %80 %137 
                              f32 %138 = OpLoad %80 
                              f32 %139 = OpFMul %138 %95 
                              f32 %140 = OpFAdd %139 %97 
                     Private f32* %141 = OpAccessChain %24 %35 
                                           OpStore %141 %140 
                              f32 %142 = OpLoad %80 
                              f32 %143 = OpLoad %80 
                              f32 %144 = OpFMul %142 %143 
                                           OpStore %80 %144 
                              f32 %145 = OpLoad %80 
                     Private f32* %146 = OpAccessChain %24 %35 
                              f32 %147 = OpLoad %146 
                              f32 %148 = OpFMul %145 %147 
                     Private f32* %149 = OpAccessChain %9 %21 
                                           OpStore %149 %148 
                            f32_2 %150 = OpLoad %9 
                            f32_2 %152 = OpExtInst %1 37 %150 %151 
                                           OpStore %9 %152 
                     Uniform f32* %157 = OpAccessChain %13 %74 %156 
                              f32 %158 = OpLoad %157 
                             bool %159 = OpFOrdEqual %158 %48 
                                           OpStore %155 %159 
                             bool %162 = OpLoad %155 
                                           OpSelectionMerge %166 None 
                                           OpBranchConditional %162 %165 %169 
                                  %165 = OpLabel 
                            f32_2 %167 = OpLoad %9 
                            f32_4 %168 = OpVectorShuffle %167 %167 0 0 0 0 
                                           OpStore %164 %168 
                                           OpBranch %166 
                                  %169 = OpLabel 
                            f32_2 %170 = OpLoad %9 
                            f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                                           OpStore %164 %171 
                                           OpBranch %166 
                                  %166 = OpLabel 
                            f32_4 %172 = OpLoad %164 
                                           OpStore %161 %172 
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